function luhn(cardnum)
    if length(cardnum) ≤ 1
        return false
    end
    new_num = collect(join(split(cardnum," "),""))
    if new_num == ['0']
        return false
    end
    if !(all(isdigit.(new_num)))
        return false
    end
    new_num = reverse([parse(Int,n) for n in new_num])
    for i in 2:2:length(new_num)
        new_num[i] = new_num[i] == 9 ? 9 : (new_num[i] * 2) % 9
    end
    return (sum(new_num) % 10) == 0
end
