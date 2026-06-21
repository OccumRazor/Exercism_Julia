# Define the pythagorean_triplets(N) function
function pythagorean_triplets(N::Int)
    results = []
    valid_as = []
    cs = floor(Int,N/3):ceil(Int,N/2)
    for c ∈ cs
        for a ∈ 1:ceil(Int,0.75c)
            b = N - a - c
            if a^2 + b^2 == c^2 && a < b
                push!(results,(a,b,c))
                push!(valid_as,a)
            end
        end
    end
    return results[sortperm(valid_as)]
end