function change(coins::Vector{Int}, target::Int)
    if target == 0 return [] end
    if target < 0 || target < minimum(coins)
        throw(DomainError(""))
    end
    reverse!(coins)
    results = Vector{Vector{Int}}()
    for i ∈ eachindex(coins)
        new_target = target
        result = Vector{Int}()
        C = coins[i:length(coins)]
        for j ∈ eachindex(C)
            if new_target ≥ C[j]
                for _ ∈ 1:floor(Int,new_target/C[j])
                    push!(result,C[j])
                end
                new_target -= floor(Int,new_target/C[j]) * C[j]
            end
        end
        if new_target == 0
            push!(results,result)
        end
    end
    if isempty(results) throw(DomainError("")) end
    counts = [length(result) for result ∈ results]
    M,loc = findmin(counts)
    return reverse!(results[loc])
end
