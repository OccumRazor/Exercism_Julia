function all_15(ratings)
    nr = filter(x->x ∈ [1,5],ratings)
    return length(nr) == length(ratings)
end

function emphatics(customers)
    c_vec = collect(customers)
    filter!(x->all_15(x[2]) == true,c_vec)
    return Dict(c_vec)
end

function tobinary(ratings)
    return map(Int64∘floor,ratings./5)
end

function tobinarymatrix(ratings)
    mat = zeros(length(ratings),length(ratings[1]))
    for i in eachindex(ratings)
        mat[i,:] = tobinary(ratings[i])
    end
    return mat
end
