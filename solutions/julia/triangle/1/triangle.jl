function invalid(sides)
    if minimum(sides) == 0
        return true
    end
    if (sides[1] + sides[2] ≥ sides[3]) && (sides[1] + sides[3] ≥ sides[2]) && (sides[3] + sides[2] ≥ sides[1])
        return false
    else
        return true
    end
end

function is_equilateral(sides)
    if invalid(sides)
        return false
    end
    return (sides[1] == sides[2] == sides[3])
end

function is_isosceles(sides)
    if invalid(sides)
        return false
    end
    return (sides[1] == sides[2] || sides[2] == sides[3] || sides[1] == sides[3])
end

function is_scalene(sides)
    if invalid(sides)
        return false
    end
    return !is_isosceles(sides)
end
