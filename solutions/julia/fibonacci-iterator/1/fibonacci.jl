# Define a custom type Fiberator
struct Fiberator
    ord::Int
end

# Implement `iterate` method(s)
function Base.iterate(f::Fiberator)
    if 1 ≤ f.ord
        return (1,(1,1,2))
    else
        return nothing
    end
end

function Base.iterate(f::Fiberator,state)
    a_0,a_1,index = state
    if index == 2
        return (1,(1,1,3))
    elseif index ≤ f.ord
        a_n = a_0+a_1
        return (a_n,(a_1,a_n,index+1))
    else
        return nothing
    end
end

# Make `collect` work
Base.length(f::Fiberator) = f.ord

# Enable Julia to infer element type
Base.eltype(::Type{Fiberator}) = Int