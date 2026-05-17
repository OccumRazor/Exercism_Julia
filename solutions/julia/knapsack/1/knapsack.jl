Item = NamedTuple{(:weight, :value), Tuple{Int, Int}}

function maximum_value(maximum_weight::Int, items::Vector{Any})
    return 0
end

function maximum_value(maximum_weight::Int, items::Vector{Item})
    weights = [item.weight for item ∈ items]
    values = [item.value for item ∈ items]
    combinations = zeros(Int,length(items)+1,maximum_weight+1)
    for i ∈ 1:length(items)
        for j ∈ 0:maximum_weight
            if weights[i] > j
                combinations[i+1,j+1] = combinations[i,j+1]
            else
                combinations[i+1,j+1] = maximum([combinations[i,j+1],combinations[i,j-weights[i]+1]+values[i]])
            end
        end
    end
    return maximum(combinations)
end
