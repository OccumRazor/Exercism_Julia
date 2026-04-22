const menu = ["Pure Strawberry Joy","Energizer","Green Garden","Tropical Island","All or Nothing"]
const T = [.5,1.5,1.5,3,5]

function time_to_mix_juice(juice)
    for i in collect(1:length(menu))
        if juice == menu[i]
            return T[i]
        end
    end
    return 2.5
end

const n_wedge = Dict("small"=>6,"medium"=>8,"large"=>10)

function wedges_from_lime(size)
    return n_wedge[size]
end

function limes_to_cut(needed, limes)
    count = 0
    i = 1
    while count < needed && i ≤ length(limes)
        count += wedges_from_lime(limes[i])
        i += 1
    end
    return  i - 1
end

function order_times(orders)
    return [time_to_mix_juice(orders[i]) for i in eachindex(orders)]
end

function remaining_orders(time_left, orders)
    id_start = 1
    time_spent = 0
    while time_spent < time_left && id_start ≤ length(orders)
        time_spent += time_to_mix_juice(orders[id_start])
        id_start += 1
    end
    if time_spent < time_left
        return []
    end
    return orders[id_start:length(orders)]
end
