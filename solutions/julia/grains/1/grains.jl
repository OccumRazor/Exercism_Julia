function syndrome(x::Int)
    if x ≤ 0 || x > 64
        throw(DomainError(x,"Condition 1 ≤ $x ≤ 64 is not satisfied."))
    end
end

"""Calculate the number of grains on square `square`."""
function on_square(square)
    syndrome(square)
    if square ≤ 32
        return 2^(square-1)
    else
        return big(2)^(square-1)
    end
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    syndrome(square)
    return sum([big(2)^(i-1) for i in 1:square])
end
