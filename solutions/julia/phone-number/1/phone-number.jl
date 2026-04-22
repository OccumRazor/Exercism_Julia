function clean(phone_number)
    number = filter(isdigit,phone_number)
    if length(number) != 11 && length(number) != 10
        throw(ArgumentError("$phone_number is not valid"))
    end
    if length(number) == 11
        if number[1] == '1'
            number = number[2:11]
        else
            throw(ArgumentError("$phone_number is not valid"))
        end
    end
    for i ∈ [1,4]
        if parse(Int,number[i]) <2
            throw(ArgumentError("$phone_number is not valid"))
        end
    end
    return number
end
