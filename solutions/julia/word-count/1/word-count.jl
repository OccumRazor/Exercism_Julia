function letters(word)
    count = 0
    for i in eachindex(word)
        if isletter(word[i])
            count += 1
        end
    end
    return count / length(word)
end

function digits(word)
    count = 0
    for i in eachindex(word)
        if isdigit(word[i])
            count += 1
        end
    end
    return count / length(word)
end

function wordcount(sentence)
    sent = lowercase(sentence)
    sent = replace(sent,","=>" ","!"=>" ","?"=>" ","\t"=>" ","\n"=>" ","."=>" ",":"=>" ")
    words = split(sent," ")
    res = Dict()
    for word in words
        if length(word) > 0
            if word[1] == '\''
                word = word[2:length(word)]
            end
            if word[length(word)] == '\''
                word = word[1:length(word)-1]
            end
        end
        if (letters(word) > 0.2) ||(digits(word) > 0.2)
            if !(word ∈ keys(res)) && word != ""
                res[word] = 1
            elseif word != ""
                res[word] += 1
            end
        end
    end
    return res
end
