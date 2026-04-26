function count_dices(dice::Vector{Int})
    return [length([i for i ∈ dice if i == j]) for j in 1:6]
end

function four_of_a_kind(dice::Vector{Int})
    d = count_dices(dice)
    for i in eachindex(d)
        if d[i] ≥ 4
            return 4i
        end
    end
    return 0
end

function full_house(dice::Vector{Int})
    d = count_dices(dice)
    triple = false
    double = false
    for i in eachindex(d)
        if d[i] == 2
            double = true
        elseif d[i] == 3
            triple = true
        end
    end
    if double && triple
        return sum(dice)
    end
    return 0
end

const s2i = Dict("ones"=>1,"twos"=>2,"threes"=>3,"fours"=>4,"fives"=>5,"sixes"=>6)

function score(dice::Vector{Int}, category::String)
    if category == "yacht"
        if  length(Set(dice)) == 1
            return 50
        end
    elseif category == "choice"
        return sum(dice)
    elseif category == "big straight"
        if Set(dice) == Set([2,3,4,5,6])
            return 30
        end
    elseif category == "little straight"
        if Set(dice) == Set([1,2,3,4,5])
            return 30
        end
    elseif category == "four of a kind"
        return four_of_a_kind(dice)
    elseif category == "full house"
        return full_house(dice)
    else
        d = s2i[category]
        return sum([i for i ∈ dice if i == d])
    end
    return 0
end

