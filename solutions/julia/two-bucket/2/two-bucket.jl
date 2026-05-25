using Base
const other_bucker = [2,1]

mutable struct Buckets
    capacity::Vector{Int}
    volume::Vector{Int}
end

fill(B::Buckets,recipient::Int) = recipient == 1 ? Buckets(B.capacity,[B.capacity[1],B.volume[2]]) : Buckets(B.capacity,[B.volume[1],B.capacity[2]]) 
empty(B::Buckets,recipient::Int) = recipient == 1 ? Buckets(B.capacity,[0,B.volume[2]]) : Buckets(B.capacity,[B.volume[1],0])
isfull(B::Buckets,recipient::Int) = B.capacity[recipient] == B.volume[recipient]
isemptyB(B::Buckets,recipient::Int) = B.volume[recipient] == 0
Base.:(==)(B1::Buckets,B2::Buckets) = B1.volume == B2.volume

function pour(B::Buckets,recipient::Int)
    total_volume = sum(B.volume)
    new_volume = total_volume > B.capacity[recipient] ? [
        B.capacity[recipient],total_volume - B.capacity[recipient]
        ] : [total_volume,0]
    if recipient == 2
        reverse!(new_volume)
    end
    return Buckets(B.capacity,new_volume)
end

function gen_actions(goal::Int,status::Buckets)
    next_statuses = Vector{Buckets}()
    for i ∈ 1:2
        if status.capacity[i] > status.volume[i] > 0
            if !isfull(status,other_bucker[i])
                push!(next_statuses,fill(status,i))
            end
            if !isemptyB(status,other_bucker[i])
                push!(next_statuses,empty(status,i))
            end
        elseif isfull(status,i)
            push!(next_statuses,empty(status,i))
        elseif isemptyB(status,i)
            push!(next_statuses,fill(status,i))
        end
        if !isemptyB(status,i) && !isfull(status,other_bucker[i])
            push!(next_statuses,pour(status,other_bucker[i]))
            if goal ∈ last(next_statuses).volume
                return [last(next_statuses)]
            end
        end
    end
    return next_statuses
end

function BFS!(goal::Int,statuses::Vector{Buckets},layers::Vector{Int},history::Vector{Buckets})
    if length(statuses) == 1
        status = statuses[1]
        if status.volume[1] == goal || status.volume[2] == goal
            return statuses
        end
    end
    push!(layers,last(layers)+1)
    len_history0 = length(history)
    new_statuses = Vector{Buckets}()
    for status ∈ statuses
        candidates = gen_actions(goal,status)
        for candidate ∈ candidates
            if !(candidate ∈ history)
                push!(new_statuses,candidate)
                push!(history,candidate)
            end
        end
    end
    for status ∈ new_statuses
        if goal ∈ status.volume
            return [status]
        end
    end
    len_history1 = length(history)
    if len_history0 == len_history1
        throw(DomainError(0,""))
    end
    return new_statuses
end

met(BS::Vector{Buckets},goal::Int) = any([goal ∈ B.volume for B ∈ BS])

function twobucket(bucket1::Int, bucket2::Int, goal::Int, start::Int)
    if goal > bucket1 && goal > bucket2
        throw(DomainError(goal,""))
    end
    actions = [1]
    if start == 1
        status0 = Buckets([bucket1,bucket2],[bucket1,0])
        rejected_status = Buckets([bucket1,bucket2],[0,bucket2])
    else
        status0 = Buckets([bucket1,bucket2],[0,bucket2])
        rejected_status = Buckets([bucket1,bucket2],[bucket1,0])
    end
    statuses = [status0]
    history = [status0,Buckets([bucket1,bucket2],[0,0]),rejected_status]
    while !met(statuses,goal)
        statuses = BFS!(goal,statuses,actions,history)
    end
    if isempty(statuses)
        throw(DomainError(goal,""))
    end
    #println("Actions: $(last(actions)), volumes: $(statuses[1].volume)")
    return statuses[1].volume[1] == goal ? (last(actions),1,statuses[1].volume[2]) : (last(actions),2,statuses[1].volume[1])
end
