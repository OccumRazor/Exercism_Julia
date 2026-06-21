function x_0(n)
    N = length(string(n))
    N = isodd(N) ? N - 1 : N
    mag = floor(Int,N/2)
    a = n / (10^2mag)
    if a < 10
        x = (.28a + .89)*10^mag
    else
        x = (.089a + 2.8)*10^mag
    end
    return x
end

function Heron(n)
    x = x_0(n)
    println("$n, $x")
    while x ^ 2 != n
        x = 0.5*(x + n/x)
        println(x)
    end
    println(x)
    return x
end

function Halley_p(n)
    x = x_0(n)
    y = n * x * x
    println("$n, $x")
    while x ^ 2 != n
        x = x*(15-y*(10-3y))/8
        y = n * x * x
        println(x)
    end
    println(x)
    return x
end

function square_root(n)
    if n < 0
        throw(DomainError(n,"Domain error for negative number"))
    end
    return Heron(n)
end
