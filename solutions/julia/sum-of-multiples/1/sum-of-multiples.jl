function sum_of_multiples(limit, factors)
    res = Set{Int}(0)
    for factor in factors
        if factor != 0
            i = 1
            while factor * i < limit
                push!(res,factor * i)
                i += 1 
            end
        end
    end
    return sum(res)
end
