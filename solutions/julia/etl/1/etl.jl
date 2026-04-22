function transform(input::AbstractDict)
    opt_dict = Dict{Char,Int}()
    for (key,value) in zip(keys(input),values(input))
        for letter in value
            opt_dict[lowercase(letter)] = key
        end
    end
    return opt_dict
end

