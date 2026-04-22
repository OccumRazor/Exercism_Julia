# define the TreasureChest{T} type

struct TreasureChest{T}
    password::String
    treasure::T
end

function get_treasure(password_attempt, chest)
    if password_attempt == chest.password
        return chest.treasure
    end
end 

function multiply_treasure(multiplier, chest)
    return TreasureChest(chest.password,[chest.treasure for _ in 1:multiplier])
end
