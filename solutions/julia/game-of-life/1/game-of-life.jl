function count_neighbors(matrix::Matrix{Int},r::Int,c::Int)
    x,y = size(matrix)
    n = 0
    for i in (r>1 ? r-1 : r):(r<x ? r+1 : r)
        for j in (c>1 ? c-1 : c):(c<y ? c+1 : c)
            n += matrix[i,j]
        end
    end
    return n - matrix[r,c]
end

function gameoflife(matrix::Matrix)
    x,y = size(matrix)
    if x == 0 || y == 0
        return matrix
    end
    next_gen = zeros(x,y)
    for i in 1:x
        for j in 1:y
            neighbors = count_neighbors(matrix,i,j)
            if matrix[i,j] == 1
                if 2 ≤ neighbors ≤ 3
                    next_gen[i,j] = 1
                else
                    next_gen[i,j] = 0
                end
            else
                if neighbors == 3
                    next_gen[i,j] = 1
                else
                    next_gen[i,j] = 0
                end
            end
        end
    end
    return next_gen
end
