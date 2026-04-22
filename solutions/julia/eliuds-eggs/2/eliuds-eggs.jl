function eggcount(number)
    spots = bitstring(Int32(number))
    eggs = 0
    for spot in spots
        if spot == '1'
            eggs += 1
        end
    end
    return eggs
end
