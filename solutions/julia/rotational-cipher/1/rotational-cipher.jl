rot(n,s) = isletter(s) ? Char(((Int(s)-(isuppercase(s) ? 65 : 97)+n)%26) + (isuppercase(s) ? 65 : 97)) : s

function rotate(n, str)
    if typeof(str) == Char
        return rot(n,str)
    end
    return String([rot(n,s) for s in collect(str)])
end
