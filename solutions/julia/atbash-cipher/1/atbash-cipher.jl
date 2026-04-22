condition(x::Char) = isletter(x) || isdigit(x)
convert(x::Char) = Char(219 - Int(x))

function encode(input)
    ipt = lowercase(input)
    ipt = [ipt[i] for i in eachindex(ipt) if condition(ipt[i])]
    for i in eachindex(ipt)
        if isletter(ipt[i])
            ipt[i] = convert(ipt[i])
        else
            ipt[i] = ipt[i]
        end
    end
    if length(ipt) > 5
        for i in 1:floor(Int,length(ipt)/5)
            insert!(ipt,6i,' ')
        end
    end
    if last(ipt) == ' '
        ipt = ipt[1:length(ipt)-1]
    end
    return String(ipt)
end

function decode(input)
    ipt = [input[i] for i in eachindex(input) if condition(input[i])]
    for i in eachindex(ipt)
        if isletter(ipt[i])
            ipt[i] = convert(ipt[i])
        else
            ipt[i] = ipt[i]
        end
    end
    return String(ipt)
end

