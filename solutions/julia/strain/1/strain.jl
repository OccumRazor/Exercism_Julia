function keep(values, predicate)
    return [value for value in values if predicate(value)]
end

function discard(values, predicate)
    return [value for value in values if !predicate(value)]
end
