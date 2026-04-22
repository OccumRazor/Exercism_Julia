function flowers(x,y,arr)
    count = 0
    x0 = length(arr)
    y0 = length(arr[1])
    x_range = (x == 1 ? 1 : x-1):(x == x0 ? x0 : x+1)
    y_range = (y == 1 ? 1 : y-1):(y == y0 ? y0 : y+1)
    for i in x_range
        for j in y_range
            if arr[i][j] == '*'
                count += 1
            end
        end
    end
    return count
end

function annotate(arr)
    if arr == []
        return arr
    end
    res = copy(arr)
    x0 = length(arr)
    y0 = length(arr[1])
    for i in 1:x0
        for j in 1:y0
            if arr[i][j] == ' '
                n_flowers =  flowers(i,j,arr)
                if n_flowers == 0 
                    text = ' '
                else
                    text = Char('0'+n_flowers)
                end
                temp = collect(res[i])
                temp[j] = text
                res[i] = join(temp,"")
            end
        end
    end
    return res
end
