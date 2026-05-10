# define the RationalNumber type
struct RationalNumber{T<:Integer} <: Real
    numerator::T
    denominator::T
    function RationalNumber{T}(a,b) where {T<:Integer}
        if a == b == 0
            throw(ArgumentError("Numberator and denominator can not both be zero."))
        end
        numerator,denominator = reduce(a,b)
        new(numerator,denominator)
    end
end

RationalNumber(a::T,b::T) where {T<:Integer} = RationalNumber{T}(a,b)
RationalNumber{Int}(a::T) where {T<:Integer} = RationalNumber{T}(a,1)
RationalNumber(a::T,b::T=one(T)) where {T<:Integer} = RationalNumber{T}(a,b)

Base.promote_rule(::Type{RationalNumber{T}},::Type{T}) where{T<:Integer} = RationalNumber{T}
Base.convert(::Type{RationalNumber{T}},x::Integer) where {T<:Integer} = RationalNumber{T}(x,1)

function Euclid(a::Int,b::Int)
    if a == 0 return 0,1 end
    if a == b || a == -b return Int(a/b),Int(b/b) end
    g1 = abs(a)
    g2 = abs(b)
    while true
        if g1 > g2
            g1 %= g2
        elseif g2 > g1
            g2 %= g1
        end
        if g1 == 0 || g2 == 0
            return Int(a/(g1 + g2)), Int(b/(g1 + g2))
        end
    end
end

function reduce(a,b)
    c,d = Euclid(a,b)
    if d < 0
        return -c, -d
    else
        return c,d
    end
end

numerator(r::RationalNumber) = r.numerator
denominator(r::RationalNumber) = r.denominator

Base.zero(::Type{RationalNumber{T}}) where {T<:Integer} = RationalNumber(0,1)
Base.one(::Type{RationalNumber{T}}) where {T<:Integer} = RationalNumber(1,1)
Base.abs(r::RationalNumber) = RationalNumber(abs(r.numerator),abs(r.denominator))
Base.:+(r1::RationalNumber,r2::RationalNumber) = RationalNumber(
    r1.numerator*r2.denominator + r2.numerator*r1.denominator, r1.denominator * r2.denominator)
Base.:-(r1::RationalNumber,r2::RationalNumber) = RationalNumber(
    r1.numerator*r2.denominator - r2.numerator*r1.denominator, r1.denominator * r2.denominator)
Base.:*(r1::RationalNumber,r2::RationalNumber) = RationalNumber(
    r1.numerator * r2.numerator, r1.denominator * r2.denominator)
Base.:/(r1::RationalNumber,r2::RationalNumber) = RationalNumber(
    r1.numerator * r2.denominator, r1.denominator * r2.numerator)
Base.:^(r1::RationalNumber,n::R) where {R<:Integer} = RationalNumber(
    r1.numerator^abs(n),r1.denominator^abs(n))
Base.:^(n::R,r1::RationalNumber) where {R<:Integer} = n ^ (r1.numerator/r1.denominator)
Base.:(==)(r1::RationalNumber,r2::RationalNumber) = r1.numerator/r1.denominator == r2.numerator/r2.denominator
Base.:<(r1::RationalNumber,r2::RationalNumber) = r1.numerator/r1.denominator < r2.numerator/r2.denominator
Base.:>(r1::RationalNumber,r2::RationalNumber) = r1.numerator/r1.denominator > r2.numerator/r2.denominator