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
    for i ∈ low:high
        for j ∈ i:high
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
    return palindrome, fs
end
