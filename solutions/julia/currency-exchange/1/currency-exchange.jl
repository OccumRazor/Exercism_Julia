function exchange_money(budget, exchange_rate)
    return budget / exchange_rate
end

function get_change(budget, exchanging_value)
    return budget - exchanging_value
end

function get_value_of_bills(denomination, number_of_bills)
    return floor(Int64,denomination * number_of_bills)
end

function get_number_of_bills(amount, denomination)
    return floor(Int64,amount/denomination)
end

function get_leftover_of_bills(amount, denomination)
    bills_frac = amount / denomination
    bills_int = floor(Int64,bills_frac)
    return denomination * (bills_frac - bills_int)
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    actual_rate = exchange_rate * (1 + spread / 100)
    new_money = budget / actual_rate
    return  floor(Int64,new_money/denomination) * denomination
end

