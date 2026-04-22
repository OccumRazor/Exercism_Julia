function layer(L::Vector{Int})
    opt = Vector{Int}(undef,length(L)+1)
    L1 = copy(L)
    insert!(L1,1,0)
    push!(L1,0)
    for i in eachindex(opt)
        opt[i] = L1[i] + L1[i+1]
    end
    return opt
end

function triangle(n)
    if n < 0
        throw(DomainError(n,"the value of $n is not valid"))
    elseif n == 0
        return []
    end
    L0 = [1]
    L = [L0]
    for _ in 2:n
        L0 = layer(L0)
        push!(L,L0)
    end
    return L
end
