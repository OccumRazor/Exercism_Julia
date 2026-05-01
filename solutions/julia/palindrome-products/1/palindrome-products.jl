function ispalindrome(num::Int)
    s = string(num)
    return s == reverse(s)
end

function palindromeproducts(low::Int, high::Int, smallest::Bool)
    if low > high
        throw(ArgumentError("low $low is larger than high $high"))
    end
    # Your code here
    palindromes = Vector{Int}()
    factors = []
    R = low:high
    if smallest
        R = reverse(R)
    end
    for i ∈ R
        for j ∈ R
            if ispalindrome(i*j)
                push!(palindromes,i*j)
                push!(factors,[i,j])
            end
        end
    end
    if isempty(palindromes)
        return nothing,[]
    end
    if smallest
        palindrome = minimum(palindromes)
    else
        palindrome = maximum(palindromes)
    end
    fs = factors[findall(x->x==palindrome,palindromes)]
    for i ∈ eachindex(fs)
        sort!(fs[i])
    end
    sort!(fs)
    new_factors = [fs[i] for i ∈ 1:length(fs)-1 if fs[i]≠fs[i+1]]
    if !(last(fs) ∈ new_factors)
        push!(new_factors,last(fs))
    end
    return palindrome, new_factors
end
