function str2Matrix(board::Vector{String})
    return reshape(vcat(collect(board[1]),collect(board[2]),collect(board[3])),3,3)
end

function judge_Line(line::Vector{Char})
    if line[1] == line[2] == line[3]
        return line[1]
    else
        return ' '
    end
end

function gamestate(board::Vector{String})
    m = str2Matrix(board)
    wins = Dict('X'=>0,'O'=>0,' '=>0)
    n_X = length(findall(x->x=='X',m))
    n_O = length(findall(x->x=='O',m))
    if n_O > n_X || (n_X - n_O) > 1
        throw(ErrorException(""))
    end
    for i ∈ 1:3
        wins[judge_Line(m[i,:])] += 1
        wins[judge_Line(m[:,i])] += 1
    end
    wins[judge_Line([m[i,i] for i ∈ 1:3])] += 1
    wins[judge_Line([m[4-i,i] for i ∈ 1:3])] += 1
    if (wins['X'] > 0 && wins['O'] == 0) || wins['O'] > 0 && wins['X'] == 0
        return "win"
    elseif wins['X'] > 0 && wins['O'] > 0
        throw(ErrorException(""))
    elseif !(' ' ∈ m) return "draw"
    else return "ongoing" end
end
