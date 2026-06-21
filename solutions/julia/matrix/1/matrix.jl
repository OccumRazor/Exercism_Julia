function matrix(strmatrix::String)
    # Your code here
    if '\n'∈strmatrix
        rows = split(strmatrix,'\n')
    else
        rows = [strmatrix]
    end
    rows = [split(rows[i]," ") for i in eachindex(rows)]
    L = length(rows[1])
    mat = [parse(Int,rows[i][j]) for i in eachindex(rows), j ∈ 1:L]
    return eachrow(mat), eachcol(mat)
end
