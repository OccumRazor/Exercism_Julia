function clean_ingredients(dish_name, dish_ingredients)
    return (dish_name,Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    intersect_size = length(drink_ingredients ∩ ALCOHOLS)
    if intersect_size == 0
        return drink_name * " Mocktail"
    else
        return drink_name * " Cocktail"
    end
end

function categorize_dish(dish_name, dish_ingredients)
    categories = Dict("OMNIVORE"=>OMNIVORE,"KETO"=>KETO,"PALEO"=>PALEO,
                        "VEGETARIAN"=>VEGETARIAN,"VEGAN"=>VEGAN)
    for (name,content) in zip(keys(categories),values(categories))
        if length(dish_ingredients ∩ content) == length(dish_ingredients)
            return dish_name * ": " * name
        end
    end
end

function tag_special_ingredients(dish)
    return (dish[1],Set(dish[2]) ∩ SPECIAL_INGREDIENTS)
end

function compile_ingredients(dishes)
    all_ingridents = Set()
    for dish in dishes
        all_ingridents = all_ingridents ∪ dish
    end
    return all_ingridents
end

function separate_appetizers(dishes, appetizers)
    dishes = Set(dishes)
    appetizers = Set(appetizers)
    candidates = setdiff(dishes,appetizers)
    dish_names = Set()
    for candidate in candidates
        push!(dish_names,candidate)
    end
    return [dish_name for dish_name in dish_names]
end

function singleton_ingredients(dishes, intersection)
    all_ingridients = compile_ingredients(dishes)
    ingridients = symdiff(all_ingridients,intersection)
    singleton = Set()
    for ingridient in ingridients
        count = 0
        #println(ingridient)
        for dish in dishes
            if ingridient ∈ dish
                count += 1 
            end
            #println(dish)
        end
        if count == 1
            push!(singleton,ingridient)
        end
        #println(count)
    end
    return singleton
end
