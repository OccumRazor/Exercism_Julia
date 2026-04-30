function largest_product(str::String, span::Int)
    if span > length(str) || str == "" || span < 0 || any([!isdigit(d) for d ∈ str])
        throw(ArgumentError(""))
    end
    N = length(str) - span + 1
    all_products = Vector{Int}(undef,N)
    all_digits = [parse(Int,d) for d ∈ collect(str)]
    for i ∈ 1:N
        product = 1
        for j ∈ 1:span
            product *= all_digits[i+j-1]
        end
        all_products[i] = product
    end
    return maximum(all_products)
end
