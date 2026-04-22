const greek_cat = collect(codepoint('α'):codepoint('϶'))

function transform(ch)
    if ch == '-'
        return "_"
    elseif ch == ' '
        return ""
    elseif codepoint(ch) in greek_cat
        return "?"
    elseif isuppercase(ch)
        return "-" * lowercase(ch)
    elseif isdigit(ch)
        return ""
    else
        return string(ch)
    end
end

function clean(str)
    result = ""
    cv = collect(str)
    for ch in cv
        st = transform(ch)
        result *= st
    end
    println(str)
    println(result)
    return result
end
