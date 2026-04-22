function dist(x,y)
    return √ (x^2 + y^2)
end

function score(x, y)
    d = dist(x,y)
    if d > 10
        return 0
    elseif d > 5
        return 1
    elseif d > 1
        return 5
    else
        return 10
    end
end
