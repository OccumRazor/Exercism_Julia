function change(coins::Vector{Int}, target::Int)
    if target == 0 return [] end
    if target < 0 || target < minimum(coins)
        throw(DomainError(""))
    end
    reverse!(coins)
    results = Vector{Vector{Int}}()
    for i ∈ eachindex(coins)
        objs = [[target,Vector{Int}()]]
        C = coins[i:length(coins)]
        for j ∈ eachindex(C)
            for o ∈ eachindex(objs)
                if objs[o][1] ≥ C[j]
                    for _ ∈ 1:floor(Int,objs[o][1]/C[j])
                        push!(objs,objs[o])
                        objs[o][1] -= C[j]
                        push!(objs[o][2],C[j])
                    end
                end
            end
        end
        for o ∈ eachindex(objs)
            if objs[o][1] == 0
                push!(results,result)
            end
        end
    end
    if isempty(results) throw(DomainError("")) end
    counts = [length(result) for result ∈ results]
    M,loc = findmin(counts)
    return reverse!(results[loc])
end
