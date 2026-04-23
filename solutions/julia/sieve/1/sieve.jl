function sieve(limit::Int)
    if limit == 1 return [] end
    domain_1 = collect(2:limit)
    marks = ones(limit - 1)
    for i in 1:limit-1
        if marks[i] == 1
            for j in i+1:limit-1
                if domain_1[j] % domain_1[i] == 0
                    marks[j] = 0
                end
            end
        end
    end
    return [domain_1[i] for i in eachindex(domain_1) if marks[i] == 1]
end
