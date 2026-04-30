# Implement number base conversion

function toDec(digits::Vector, base::Int)
    num = 0
    for i ∈ 1:length(digits)
        num += digits[i] * base ^ (length(digits)-i)
    end
    return num
end

function fromDec!(num::Int, base::Int)
    L = 1
    while base^L < num
        L += 1
    end
    opt = Vector{Int}(undef,L)
    for i ∈ 1:L
        opt[i] = floor(Int,num/(base^(L-i)))
        num -= opt[i] * (base^(L-i))
    end
    return opt
end

function all_your_base(digits::Vector, base_in::Int, base_out::Int)
    if base_in ≤ 1 || base_out ≤ 1 || any([digit < 0 || digit ≥ base_in for digit in digits])
        throw(DomainError(0,"base_in ≤ 1 || base_out ≤ 1 || any([digit < 0 || digit ≥ base_in for digit in digits])"))
    end
    if isempty(digits)
        return [0]
    end
    num = toDec(digits,base_in)
    if num == 0 return [0] end
    return fromDec!(num,base_out)
end
