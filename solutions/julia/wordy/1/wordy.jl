function Base.isdigit(s)
    cs = collect(s)
    if cs[1] == '-'
        return all([isdigit(cs[i]) for i in 2:length(cs)])
    end
    return all([isdigit(c) for c in cs])
end

function isop(s)
    if s == "cubed" throw(ArgumentError("")) end
    return s ∈ ["plus","minus","multiplied","divided"]
end

function s2d(s)
    return parse(Int,s)
end

function operate(s1,s2,s3)
    if s1 isa SubString
        x = s2d(s1)
    else
        x = s1
    end
    y = s2d(s3)
    if s2 == "plus"
        return x+y
    elseif s2 == "minus"
        return x-y
    elseif s2 == "multiplied"
        return x*y
    elseif s2 == "divided"
        return x/y
    end
end



function wordy(problem::String)
    words = split(problem[1:length(problem)-1], " ")
    filter!(e->e≠"by",words)
    digits = [isdigit(word) for word in words]
    ops = [isop(word) for word in words]
    n_words = length(words)
    if any([length([d for d in digits if d == true]) == 1 && n_words ≠ 3,
        length([d for d in digits if d == true]) == 0,
        any([digits[i] == digits[i+1] == true for i in 1:n_words-1]),
        any([ops[i] == ops[i+1] == true for i in 1:n_words-1])])
        throw(ArgumentError(""))
    end
    if length([d for d in digits if d == true]) == 1
        for i in 1:n_words
            if digits[i]
                return s2d(words[i])
            end
        end
    end
    flag = false
    num = 0
    for i ∈ 2:n_words-1
        if ops[i]
            if flag
                num = operate(num,words[i],words[i+1])
            else
                flag = true
                num = operate(words[i-1],words[i],words[i+1])
            end
        end
    end
    return num
end
