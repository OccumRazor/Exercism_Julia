function eggcount(number)
    spots = bitstring(UInt8(number))
    eggs = 0
    for spot in spots
        if spot == '1'
            egge += 1
        end
    end
    return eggs
end
