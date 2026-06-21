function rows(letter::String)
    n_letter = Int(collect(letter)[1]) - 64
    result = Vector{String}()
    for i in 1:n_letter
        if i == 1
            str = " "^(n_letter - 1) *"A"*" "^(n_letter - 1)
        else
            str = " " ^ (n_letter - i) * string(Char(i)+64) * " " ^ (2i - 3) * string(Char(i)+64) * " " ^ (n_letter - i)
        end
        push!(result,str)
    end
    for i in n_letter-1:-1:1
        push!(result,result[i])
    end
    return result
end
