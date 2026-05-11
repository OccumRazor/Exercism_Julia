function n_ones(str::String,n::Int)
    return sum([parse(Int,i) for i ∈ collect(str[(length(str) - n+1):length(str)])])
end

function bitstring2permmap(str::String,n::Int)
    temp = collect(str[(length(str) - n+1):length(str)])
    return [i for i ∈ eachindex(temp) if temp[i] == '1']
end

function combinations(elements::Vector{Int},n_pick::Int)
    search_space = [Vector{Int}(undef,n_pick) for _ ∈ 1:Int(factorial(length(elements))/factorial(length(elements) - n_pick)/factorial(n_pick))]
    count = 1
    for i ∈ 1:2^length(elements)
        if n_ones(bitstring(Int16(i)),length(elements)) == n_pick
            search_space[count] = elements[bitstring2permmap(bitstring(Int16(i)),length(elements))]
            count += 1
        end
    end
    return search_space
end

function combinations_in_cage(total, numsquares, restricted=nothing)
    results = []
    if isnothing(restricted)
        selects = collect(1:9)
    else
        selects = [i for i ∈ 1:9 if !(i ∈ restricted)]
    end
    search_space = combinations(selects,numsquares)
    for i ∈ eachindex(search_space)
        if sum(search_space[i]) == total
            push!(results,search_space[i])
        end
    end
    return sort!(results)
end
