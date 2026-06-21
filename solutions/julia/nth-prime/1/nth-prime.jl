function isprime(n::Int)
    for i ∈ 3:2:n-1
        if n % i == 0
            return false
        end
    end
    return true
end

function prime(num::Int)
    if num == 0
        throw(ErrorException("No such prime!"))
    end
    primes = Vector{Int}(undef,num)
    primes[1] = 2
    for i ∈ 2:num
        not_found = true
        candidate = primes[i-1] + 1
        if iseven(candidate) candidate += 1 end
        while not_found
            if isprime(candidate)
                primes[i] = candidate
                not_found  = false
            else
                candidate += 2
            end
        end
    end
    return last(primes)
end
