function demote(n)
    if !(n isa Number)
        throw(MethodError("no method matching demote(::$(typeof(n)))",n))
    else
        if typeof(n) == Float64
            return UInt8(ceil(n))
        elseif n isa Integer
            return Int8(ceil(n))
        else
            throw(MethodError("no method matching demote(::$(typeof(n)))",n))
        end
    end
end

function preprocess(coll)
    if coll isa Set
        coll = collect(coll)
        return sort([demote(coll[i]) for i in eachindex(coll)],rev=true)
    elseif !(coll isa Vector)
        throw(MethodError("no method matching demote(::$(typeof(coll)))",coll))
    else
        1
    end
    return reverse([demote(coll[i]) for i in eachindex(coll)])
end
