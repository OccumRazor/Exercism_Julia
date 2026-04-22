function create_inventory(items)
    inventory = Dict()
    for item in items
        if haskey(inventory,item)
            inventory[item] += 1
        else
            inventory[item] = 1
        end
    end
    return inventory
end

function add_items(inventory, items)
    for item in items
        if haskey(inventory,item)
            inventory[item] += 1
        else
            inventory[item] = 1
        end
    end
    return inventory
end

function decrement_items(inventory, items)
    for item in items
        if haskey(inventory,item)
            inventory[item] -= 1
            if inventory[item] < 0
                inventory[item] = 0
            end
        else
            continue
        end
    end
    return inventory
end

function remove_item(inventory, item)
    delete!(inventory,item)
end

function list_inventory(inventory)
    storage = []
    for key in keys(inventory)
        if inventory[key] > 0
            push!(storage,key=>inventory[key])
        end
    end
    sort!(storage,by = x -> x[1])
    return storage
end
