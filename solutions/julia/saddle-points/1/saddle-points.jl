function maxes(row)
    max_val = maximum(row)
    return (max_val,findall(a->a==max_val,row))
end

function saddlepoints_row(M::Matrix)
    cols = maxes(M)
    return NTuple{2,Int}[col for col in cols[2]]
end

function mines(row)
    max_val = minimum(row)
    rows = findall(a->a==max_val,row)
    println(rows)
    return NTuple{2,Int}[row for row in rows]
end

function saddlepoints(M)
    saddles = NTuple{2,Int}[]
    if isempty(M) return saddles end
    x,y = size(M)
    if x == 1
        return saddlepoints_row(M)
    end
    if y == 1
        return mines(M)
    end
    for r ∈ 1:x
        row_maxes = maxes(M[r,:])
        for i ∈ row_maxes[2]
            col_min = minimum(M[:,i])
            if row_maxes[1] == col_min
                push!(saddles,(r,i))
            end
        end
    end
    return saddles
end
