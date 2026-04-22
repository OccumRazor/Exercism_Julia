function cleanupname(name)
    chs = collect(name)
    new_chs = [' ']
    for i in eachindex(chs)
        if chs[i] == ' '
            continue
        elseif chs[i] == '-'
            if i == 1 || i == length(chs)
                continue
            else
                if isletter(chs[i-1]) && isletter(chs[i+1])
                    push!(new_chs,' ')
                end
            end
        elseif !isletter(chs[i])
            continue
        else
            push!(new_chs,chs[i])
        end
    end
    popfirst!(new_chs)
    return String(new_chs)
end

function firstletter(name)
    return string((first∘cleanupname)(name))
end

function initial(name)
    return string((titlecase∘firstletter)(name))*"."
end

function couple(name1, name2)
    initials = initial.([name1,name2])
    return "❤ "*initials[1]*"  +  "*initials[2]*" ❤"
end
