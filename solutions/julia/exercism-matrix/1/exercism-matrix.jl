const E = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0;
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0;
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
]

function frown(E)
    new_E = copy(E)
    rev = E[9:-1:7,7:12]
    new_E[7:9,7:12] = rev
    return new_E
end

function frown!(E1)
    rev = E1[9:-1:7,7:12]
    E1[7:9,7:12] = rev
    return E1
end



function stickerwall(E)
    E1 = frown(E)
    n_row , n_col = size(E1)
    n_row2 = 2n_row + 1
    n_col2 = 2n_col
    wall = ones(n_row2,n_col2)
    wall[1:n_row,1:n_col] = E
    wall[1:n_row,n_col+1:n_col2] = E1
    wall[n_row+2:n_row2,1:n_col] = E1
    wall[n_row+2:n_row2,n_col+1:n_col2] = E
    return wall
end

function colpixelcount(E)
    E1 = copy(E)
    n_1s = sum(E1,dims=1)
    return E1 .* n_1s
end

function render(E)
    n_row , n_col = size(E)
    E1 = [' ' for _ in 1:n_row,_ in 1:n_col]
    for i in 1:n_row
        for j in 1:n_col
            if E[i,j] != 0
                E1[i,j] = 'X'
            end
        end
    end
    str = ""
    for i in 1:n_row
        str *= String(E1[i,:])
        if i < n_row
            str *= "\n"
        end
    end
    return str
end
