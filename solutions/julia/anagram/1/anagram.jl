function count_letters(word::String)
    letters = collect(word)
    dict = Dict{Char,Int}()
    for letter in letters
        if ! (letter ∈ keys(dict))
            dict[letter] = 1
        else
            dict[letter] += 1
        end
    end
    return dict
end

function agent(word0::String,word1::String)
    word0_l = lowercase(word0)
    word1_l = lowercase(word1)
    if Set(word0_l) == Set(word1_l) && length(word0) == length(word1) && word0 != word1
        if word0_l == word1_l
            return false
        end
        if count_letters(word0_l) != count_letters(word1_l) return false end
        return true
    else
        return false
    end
end

function detect_anagrams(subject, candidates)
    res = Vector{String}()
    for candidate in candidates
        if agent(subject,candidate) 
            push!(res,candidate)
        end
    end
    return res
end
