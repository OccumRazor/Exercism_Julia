
# Define an abstract type Pet

abstract type Pet end

# Define concrete types Dog and Cat

struct Dog<:Pet
    name::String
end

struct Cat<:Pet
    name::String
end

# Define a name() function

name(p::Pet) = p.name# Implement this

# Define multiple methods for meets(a, b)
# Only the first one is stubbed

meets(a::Dog, b::Dog) = "sniffs"# Implement this
meets(a::Cat, b::Dog) = "hisses"
meets(a::Dog, b::Cat) = "chases"
meets(a::Cat, b::Cat) = "slinks"
meets(a::P1,b::P2) where{P1<:Pet,P2<:Pet} = "is cautious"
# Implement the encounter(a, b) function

encounter(a::A,b::B) where{A<:Pet,B<:Pet} = "$(name(a)) meets $(name(b)) and $(meets(a,b))."
encounter(a::A,b::B) where{A<:Pet,B} = "$(name(a)) meets $(name(b)) and runs away."
encounter(a::A,b::B) where{A,B} = "$(name(a)) meets $(name(b)) and nothing happens."
# Define three fallback methods for meets(a, b)
# Stubs are not provided for these, but look at the hints if necessary
