struct InvalidPosition <: Exception

end

struct Queen
    x::Int
    y::Int
    function Queen(x,y)
        if x > 7 || y > 7
            throw(InvalidPosition())
        end
        new(x,y)
    end
end

function canattack(white::Queen, black::Queen)
    if white.x == black.x || white.y == black.y || abs(white.x - black.x) == abs(white.y - black.y)
        return true
    end
    return false
end
