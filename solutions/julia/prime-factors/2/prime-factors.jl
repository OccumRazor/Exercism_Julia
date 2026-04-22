using Primes

function prime_factors(n)
    result = Vector{Int64}()
    num = n
    while num != 1
        if num ≥ 10^7
            candidates = primes(floor(Int,num/100000))
        else
            candidates = primes(floor(Int,num))
        end
        for i in eachindex(candidates)
            while num % candidates[i] == 0
                num /= candidates[i]
                push!(result,candidates[i])
                break
            end
        end
    end
    return sort!(result)
end
