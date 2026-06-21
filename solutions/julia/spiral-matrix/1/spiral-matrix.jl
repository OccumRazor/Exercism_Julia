function spiral_matrix(n::Int)
    if n == 0
        return Matrix{Int}(undef,0,0)
    elseif n == 1
        return ones(1,1)
    end
    mat = zeros(Int,n,n)
    x = 1
    y = 1
    direction = 0
    for i in 1:n^2
        mat[x,y] = i
        if direction == 0
            if x == n
                direction = 1
                y += 1
            elseif mat[x+1,y] != 0 
                direction = 1
                y += 1
            else
                x += 1
            end
        elseif direction == 1
            if y == n
                direction = 2
                x -= 1
            elseif mat[x,y+1] != 0
                direction = 2
                x -= 1
            else
                y += 1
            end
        elseif direction == 2
            if x == 1
                direction = 3
                y -= 1
            elseif mat[x-1,y] != 0
                direction = 3
                y -= 1
            else
                x -= 1
            end
        else
            if mat[x,y-1] != 0
                direction = 0
                x += 1
            else
                y -= 1
            end
        end
    end
    return mat'
end
