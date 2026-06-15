function neighbors(mat::Matrix{Int},loc::Vector{Int},board_size::Vector{Int})
    N = Vector()
    x,y = loc
    for i ∈ (x > 1 ? x-1 : 1):(x < board_size[1] ? x+1 : x)
        for j ∈ (y > 1 ? y-1 : 1):(y < board_size[2] ? y+1 : y)
            if mat[i,j] == 1 && !all([i == x,j == y])
                push!(N,[i,j])
            end
        end
    end
    return N
end

function DFS(mat::Matrix{Int},board_size::Vector{Int})
    nodes = findall(x->x==1,mat[1,:])
    for y ∈ nodes
        visited_nodes = [[1,y]]
        locs = [[1,y]]
        while !isempty(locs)
            new_locs = []
            for loc ∈ locs
                ns = neighbors(mat,loc,board_size)
                for n ∈ ns
                    if !(n ∈ visited_nodes)
                        push!(visited_nodes,n)
                        if n[1] == board_size[1]
                            return true
                        end
                        push!(new_locs,n)
                    end
                end
            end
            locs = new_locs
        end
    end
    return false
end

function win(new_board::Vector{String},player::Char,board_size::Vector{Int})
    locs = [findall(x->x==player,line) for line ∈ new_board]
    if !all([length(loc) > 0 for loc ∈ locs])
        return false
    end
    M = Matrix(reduce(hcat,[[el == player ? 1 : 0 for el ∈ new_board[i]] for i ∈ 1:board_size[1]])')
    println(M)
    for l ∈ 1:board_size[1]
        println(M[l,:])
    end
    println("______________________________________")
    return DFS(M,board_size)
end

function connect(board::Vector{String})
    if length(board) == 1
        if board[1] == "X" return "X"
        elseif board[1] == "O" return "O"
        else return ""
        end
    end
    new_board = [filter(x->x!=' ',board[i]) for i ∈ eachindex(board)]
    board_size = [length(new_board),length(new_board[1])]
    if new_board == ["."^board_size[2] for _ ∈ 1:board_size[1]] return "" end
    println(new_board)
    oWin = win(new_board,'O',board_size)
    if oWin return "O" end
    t_board = [
        String([new_board[i][j] for i ∈ 1:board_size[1]]) for j ∈ 1:board_size[2]
    ]
    println(t_board)
    xWin = win(t_board,'X',reverse!(board_size))
    if xWin return "X" end
    return ""
end
