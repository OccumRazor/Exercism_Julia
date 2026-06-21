function aliquots_sum(n::Int)
    if n ≤ 0
        throw(DomainError(n,"Only natural numbers are allowed."))
    end
    aliquots = Vector{Int}()
    if iseven(n)
        for i ∈ 1:n-1
            if n % i == 0
                push!(aliquots,i)
            end
        end
    else
        for i ∈ 1:2:n-1
            if n % i == 0
                push!(aliquots,i)
            end
        end
    end
    return sum(aliquots)
end

function isperfect(n::Int)
    return aliquots_sum(n) == n
end

function isabundant(n::Int)
    return aliquots_sum(n) > n
end

function isdeficient(n::Int)
    return aliquots_sum(n) < n
end
