const divisors = [1 5;10 50;100 500;1000 0 ]
const letters = ["I" "V"; "X" "L"; "C" "D";"M" ""]

function to_roman(number)
    if number ≤ 0
        throw(ErrorException("Only positive integers are allowed."))
    end
    res = Vector{String}()
    for i in 3:-1:0
        if number ≥ 5*10^i
            number -= 5*10^i
            push!(res,letters[i+1,2])
        end
        if number ≥ 4*10^i
            number -= 4*10^i
            push!(res,letters[i+1,1]*letters[i+1,2])
        end
        while number ≥ 10^i
            number -= 10^i
            push!(res,letters[i+1,1])
        end
        if number ≥ 0.9 * 10^i
            number -= 0.9 * 10^i
            push!(res,letters[i,1]*letters[i+1,1])
        end
    end
    return join(res,"")
end
