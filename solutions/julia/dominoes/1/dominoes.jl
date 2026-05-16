function count_digits(stones::Vector{Vector{Int}})
    counts = [0,0,0,0,0,0]
    for s ∈ stones
        for d ∈ s
            counts[d] += 1
        end
    end
    return counts
end

function loop_next(stones::Vector{Vector{Int}},dots::Int,order::Vector)
    matches = []
    for i ∈ setdiff(eachindex(stones),order)
        for j ∈ 1:2
            if dots == stones[i][j]
                push!(matches,[stones[i][[2,1][j]],[order;i]])
            end
        end
    end
    return matches
end

function find_match(stones::Vector{Vector{Int}})
    orders = [[stones[1][1],[1]],[stones[1][2],[1]]]
    while !isempty(orders)
        new_orders = Vector{Vector}()
        for order ∈ orders
            matches = loop_next(stones,order[1],order[2])
            if !isempty(matches)
                for match ∈ matches
                    if length(stones) == length(match[2]) return true end
                    push!(new_orders,match)
                end
            end
        end
        orders = new_orders
    end
    return false
end

function dominoes(stones::Vector)
    if isempty(stones) return true end
    if stones isa Vector{Int} return stones[1] == stones[2] end
    counts = count_digits(stones)
    if !all([iseven(d) for d ∈ counts]) return false end
    stones_discarded = []
    for i ∈ eachindex(stones)
        if stones[i][1] == stones[i][2]
            if counts[stones[i][1]] == 2
                return false
            else
                counts[stones[i][1]] -= 2
                push!(stones_discarded,i)
            end
        end
    end
    return find_match(stones[setdiff(collect(eachindex(stones)),stones_discarded)])
end
