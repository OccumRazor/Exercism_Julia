import Base

# define the CustomSet type
mutable struct CustomSet{T} <: Base.AbstractSet{T}
    elements::Vector{T}
    function CustomSet{T}(x::Vector{T}) where {T}
        elements = Vector{T}()
        for i ∈ x
            if ! (i ∈ elements)
                push!(elements,i)
            end
        end
        new(elements)
    end
end

CustomSet(x::Vector{T}) where{T} = CustomSet{T}(x)

Base.eltype(s::CustomSet) = eltype(s.elements)
Base.isempty(x::CustomSet) = isempty(x.elements)
Base.in(element,x::CustomSet) = element ∈ x.elements
Base.length(s::CustomSet) = length(s.elements)
Base.issubset(s1::CustomSet,s2::CustomSet) = length(s1) ≤ length(s2) ? 
    all([e ∈ s2.elements for e ∈ s1.elements]) : false
disjoint(s1::CustomSet,s2::CustomSet) = all([!(e ∈ s2.elements) for e ∈ s1.elements])
Base.:(==)(s1::CustomSet,s2::CustomSet) = issubset(s1,s2) && issubset(s2,s1)
function Base.push!(x::CustomSet,y)
    if !(y ∈ x.elements)
        push!(x.elements,y)
    end
end

function Base.intersect!(s1::CustomSet,s2::CustomSet)
    valid_x = Vector()
    for e ∈ s1.elements
        if e ∈ s2.elements
            push!(valid_x,e)
        end
    end
    s1.elements = valid_x
end

Base.intersect(s1::CustomSet,s2::CustomSet) = CustomSet([e for e ∈ s1.elements if e ∈ s2.elements])

function complement!(s1::CustomSet,s2::CustomSet)
    valid_x = Vector()
    for e ∈ s1.elements
        if ! (e ∈ s2.elements)
            push!(valid_x,e)
        end
    end
    s1.elements = valid_x
end

complement(s1::CustomSet,s2::CustomSet) =  CustomSet([e for e ∈ s1.elements if ! (e ∈ s2.elements)])

function Base.union!(s1::CustomSet,s2::CustomSet)
    for e ∈ s2.elements
        if ! (e ∈ s1.elements)
            push!(s1,e)
        end
    end
end

Base.union(s1::CustomSet,s2::CustomSet) = CustomSet([s1.elements;s2.elements])
Base.getindex(s::CustomSet,k) = s.elements[k]

Base.copy(s::CustomSet) = CustomSet(s.elements)
Base.iterate(s::CustomSet,x::Int) = Base.iterate(s.elements,x::Int)
Base.iterate(s::CustomSet) = Base.iterate(s.elements)