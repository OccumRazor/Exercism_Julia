function collatz_steps(n::Int)
    if n ≤ 0
        throw(DomainError(n,"n ($n) should be larger than zero."))
    end
    steps = 0
    while n > 1
        if isodd(n)
            n = 3n + 1
        else
            n = 0.5n
        end
        steps += 1
    end
    return steps
end
