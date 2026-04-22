function items2dict(items)
    cart_dict = Dict()
    for item in items
        if item ∈ keys(cart_dict)
            cart_dict[item] += 1
        else
            cart_dict[item] = 1
        end
    end
    return cart_dict
end

function additems!(cart, items)
    mergewith!(+,cart,items2dict(items))
    return cart
end

function update_recipes!(ideas, updates)
    for (name,recipe) in zip(keys(updates),values(updates))
        ideas[name] = recipe
    end
    return ideas
end

function send_to_store(cart, aislecodes)
    vec0 = [aislecodes[key] for key in keys(cart)]
    ord = sortperm(vec0)
    vec = [aislecodes[key]=>cart[key] for key in keys(cart)]
    return vec[ord]
end

function update_store_inventory!(inventory, cart)
    mergewith!(-,inventory,cart)
    for key in keys(inventory)
        if inventory[key] < 0
            inventory[key] = 0
        end
    end
    vec = [key=>inventory[key] for key in keys(inventory) if inventory[key] == 0]
    return Dict(vec)
end

function reorder!(outofstock, stock)
    for key in keys(outofstock)
        if !(key in keys(stock))
            stock[key] = 100
        end
        outofstock[key] = stock[key]
    end
    return outofstock
end
