function loop_all(coin::Int,solutions::Vector,ismean::Bool)
    new_solutions = []
    for i ∈ eachindex(solutions)
        if solutions[i][1] == 0
            push!(new_solutions,solutions[i])
        elseif solutions[i][1] ≥ coin
            if !ismean
                for j ∈ 0:floor(Int,solutions[i][1]/coin)
                    push!(new_solutions,[solutions[i][1]-j*coin,[solutions[i][2];[coin for _ ∈ 1:j]]])
                end
            else
                j = floor(Int,solutions[i][1]/coin)
                push!(new_solutions,[solutions[i][1]-j*coin,[solutions[i][2];[coin for _ ∈ 1:j]]])
            end
        end
    end
    if isempty(new_solutions) return solutions end
    return new_solutions
end

function find_solutions(coins::Vector{Int}, target::Int)
    results = Vector{Vector{Int}}()
    for i ∈ eachindex(coins)
        objs = [[target,Vector{Int}()]]
        C = coins[i:length(coins)]
        for j ∈ eachindex(C)
            objs = loop_all(C[j],objs,C[j]==minimum(C))
        end
        for o ∈ eachindex(objs)
            if objs[o][1] == 0
                if length(objs[o][2]) == 1
                    return [objs[o][2]]
                end
                push!(results,objs[o][2])
            end
        end
    end
    return results
end

function pre_search(coins::Vector{Int},target::Int)
    result0 = []
    for i ∈ 1:3
        j = floor(Int,target/coins[i])
        target -= j*coins[i]
        result0 = [result0;[coins[i] for _ ∈ 1:j]]
    end
    return result0,target
end

function change(coins::Vector{Int}, target::Int)
    if target == 0 return [] end
    if target < 0 || target < minimum(coins)
        throw(DomainError(""))
    end
    reverse!(coins)
    large = false
    if target > 100
        result0,target = pre_search(coins,target)
        large = true
    end
    results = find_solutions(coins,target)
    if isempty(results) throw(DomainError("")) end
    counts = [length(result) for result ∈ results]
    M,loc = findmin(counts)
    if large return reverse!([result0;results[loc]])
    else return reverse!(results[loc]) end
end
