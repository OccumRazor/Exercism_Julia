const brackets = ['(','[','{','}',']',')']
const links = ['(','[','{']
const rechts = ['}',']',')']
function strip(str::String)
    return [s for s ∈ collect(str) if s ∈ brackets]
end

function count_brackets(str::Vector{Char})
    pair1 = length(findall(x->x=='(',str)) == length(findall(x->x==')',str))
    pair2 = length(findall(x->x=='[',str)) == length(findall(x->x==']',str))
    pair3 = length(findall(x->x=='{',str)) == length(findall(x->x=='}',str))
    return pair1 && pair2 && pair3
end

function isclosed(str::Vector{Char})
    return (str[1] == '(' && str[2] ==')') || (str[1] == '[' && str[2] ==']') || (str[1] == '{' && str[2] =='}')
end

function matching_brackets(input_string::String)
    target = strip(input_string)
    if isodd(length(target))
        return false
    elseif !count_brackets(target)
        return false
    else
        if length(target) == 0 return true end
        if target[1] ∈ rechts || last(target) ∈ links
            return false
        end
        old_length = length(target)
        new_length = length(target) - 1
        while length(target) > 0 && old_length != new_length
            old_length = length(target)
            leftover = Vector{Char}()
            for i ∈ 1:length(target) - 1
                if target[i] ∈ links
                    if !isclosed(target[i:i+1])
                        push!(leftover,target[i])
                    end
                else
                    if !isclosed(target[i-1:i])
                        push!(leftover,target[i])
                    end
                end
            end
            if !isclosed(target[old_length-1:old_length])
                push!(leftover,last(target))
            end
            new_length = length(leftover)
            target = leftover
        end
        if length(target) == 0
            return true
        else
            return false
        end
    end
end
