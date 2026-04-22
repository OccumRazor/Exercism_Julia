function encode(s)
    if s == "" return s end
    res = ""
    s0 = s[1]
    count = 0
    for i in eachindex(s)
        if s[i] == s0
            count += 1
        else
            if count > 1
                res *= string(count)
            end
            count = 1
            res *= string(s0)
            s0 = s[i]
        end
    end
    if count > 1
        res *= string(count)
    end
    res *= string(s0)
    return res
end



function decode(s)
    x = collect(s)
    res = ""
    num = ""
    for i in eachindex(x)
        if isdigit(x[i])
            num *= string(x[i])
        else
            if num == ""
                res *= string(x[i])
            else
                res *= x[i]^parse(Int16,num)
                num = ""
            end
        end
    end
    return res
end
