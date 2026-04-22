function clothingitem(categories, qualities)
    return Dict(categories[i]=>qualities[i] for i in eachindex(categories))
end

function get_combinations(tops, bottoms)
    return [(tops[i],bottoms[j]) for i in eachindex(tops),j in eachindex(bottoms)]
end

function get_prices(combos)
    if combos isa Matrix
        x,y = size(combos)
        return [sum([combos[i,j][1]["price"],combos[i,j][2]["price"]]) for i in 1:x,j in 1:y]
    else
        return [sum([combos[i][1]["price"],combos[i][2]["price"]]) for i in eachindex(combos)]
    end
end

function color_match(combo)
    return combo[1]["base_color"] == combo[2]["base_color"] ? false : true
end

function filter_clashing(combos)
    x,y = size(combos)
    return [combos[i,j] for j in 1:y for i in 1:x if color_match(combos[i,j])]
end
