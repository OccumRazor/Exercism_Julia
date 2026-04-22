const sound = ["Pling","Plang","Plong"]
const diviser = [3,5,7]

function raindrops(number)
    res = ""
    for i in 1:3
        if number % diviser[i] == 0
            res *= sound[i]
        end
    end
    if length(res) == 0
        return string(number)
    else
        return res
    end
end
