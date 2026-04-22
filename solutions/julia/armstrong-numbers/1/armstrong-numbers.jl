function isarmstrong(n)
    N = collect(string(n))
    p = length(N)
    N = [parse(Int,i)^p for i in N]
    return sum(N) == n
end
