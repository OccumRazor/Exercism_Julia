function can_do_fast_attack(knight_awake)
    return !knight_awake
end

function can_spy(knight_awake, archer_awake, prisoner_awake)
    return (knight_awake||archer_awake)||prisoner_awake
end

function can_signal_prisoner(archer_awake, prisoner_awake)
    return (!archer_awake)&&prisoner_awake
end

function can_free_prisoner(knight_awake, archer_awake, prisoner_awake, dog_present)
    if (!archer_awake)&&dog_present
        return true
    end
    if prisoner_awake&&(!(knight_awake||archer_awake))
        return true
    end
    return false
end
