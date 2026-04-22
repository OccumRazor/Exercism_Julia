const vowels = ['a','e','i','o','u']
const special_consonants = ["ch","th"]


function Rule0!(phrase::SubString{String})
    if phrase[1] ∈ vowels || phrase[1:2] ∈ ["xr","yt"]
        return Rule1!(phrase)
    else
        if occursin("qu",phrase)
            return Rule3!(phrase)
        elseif occursin("y",phrase)
            return Rule4!(phrase)
        else
            return Rule2!(phrase)
        end
    end
end

function Rule1!(phrase::SubString{String})
    return phrase * "ay"
end

function Rule2!(phrase::SubString{String})
    n_consonants = 1
    for i in 2:length(phrase)
        if !(phrase[i] ∈ vowels)
            n_consonants += 1
        else
            break
        end
    end
    return phrase[n_consonants+1:length(phrase)] * phrase[1:n_consonants] * "ay"
end

function Rule3!(phrase::SubString{String})
    qu = findfirst("qu",phrase)
    if qu[1] == 1
        return phrase[3:length(phrase)] * "quay"
    else
        if phrase[qu[1] - 1] ∈ vowels
            return phrase[qu[1]-1:length(phrase)] * phrase[1:qu[1]-2] * "ay"
        end
        return phrase[qu[2] + 1:length(phrase)] * phrase[1:qu[2]] * "ay"
    end
end

function Rule4!(phrase::SubString{String})
    y = findfirst("y",phrase)
    if typeof(y) != Nothing
        if any([letter ∈ vowels for letter in phrase[1:y[1]]])
            return Rule2!(phrase)
        end
        if y[1] > 1
            return "y" * phrase[y[1]+1:length(phrase)] * phrase[1:y[1]-1] * "ay"
        else
            return phrase[2:length(phrase)] * "yay"
        end
    else
        return Rule2!(phrase)
    end
end

function translate(phrase::String)
    ps = split(phrase," ")
    return join([Rule0!(p) for p in ps]," ")
end

