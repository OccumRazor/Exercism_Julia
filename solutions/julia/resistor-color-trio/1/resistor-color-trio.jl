const value_dict = Dict("black"=>0,"brown"=>1,"red"=>2,"orange"=>3,"yellow"=>4,
                        "green"=>5,"blue"=>6,"violet"=>7,"grey"=>8,"white"=>9)

function label(colors::Vector{String})
    val = value_dict[colors[1]] * 10 + value_dict[colors[2]]
    mag = value_dict[colors[3]]
    if mag < 2
        unit = "ohms"
        mag = 10 ^ mag
    elseif mag < 5
        unit = "kiloohms"
        if mag == 2
            if floor(Int,val/10) == val/10
                val = floor(Int,val/10)
            else
                val = "$(value_dict[colors[1]]).$(value_dict[colors[2]])"
            end
            return "$val $unit"
        end
            mag = 10 ^ (mag - 3)
    elseif mag < 8
        unit = "megaohms"
        if mag == 5
            val = "$(value_dict[colors[1]]).$(value_dict[colors[2]])"
            return "$val $unit"
        end
        mag = 10 ^ (mag - 6)
    else
        unit = "gigaohms"
        if mag == 8
            val = "$(value_dict[colors[1]]).$(value_dict[colors[2]])"
            return "$val $unit"
        end
        mag = 10 ^ (mag - 9)
    end
    return "$(val*mag) $unit"
end
