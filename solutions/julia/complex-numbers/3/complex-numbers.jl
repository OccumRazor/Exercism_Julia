import Base

# Uncomment the following line to enable bonus tests involving arithmetic between real numbers and complex numbers.
enable_realcomplex_tests = true

# Uncomment the following line to enable bonus tests for syntax sugar.
enable_syntaxsugar_tests = true

struct ComplexNumber{T<:Real} <: Number
    real::T
    imag::T
end

ComplexNumber(x::Real,y::Real) = ComplexNumber(promote(x,y)...)
ComplexNumber(x::T,y::T=zero(T)) where{T<:Real} = ComplexNumber{T}(x,y)
ComplexNumber(x::Real) = ComplexNumber(promote(x,0.))

const jm = ComplexNumber(0,1)

Base.promote_rule(::Type{ComplexNumber{T}},::Type{T}) where{T<:Real} = ComplexNumber{T}
Base.convert(::Type{ComplexNumber{T}},x::Real) where{T<:Number} = ComplexNumber(x,0)

Base.:+(a::ComplexNumber,b::ComplexNumber) = ComplexNumber(a.real+b.real,a.imag+b.imag)
Base.:-(a::ComplexNumber,b::ComplexNumber) = ComplexNumber(a.real-b.real,a.imag-b.imag)
Base.:*(a::ComplexNumber,b::ComplexNumber) = ComplexNumber(a.real*b.real-a.imag*b.imag,
                                            a.imag*b.real+a.real*b.imag)
Base.:/(a::ComplexNumber,b::ComplexNumber) = ComplexNumber((a.real*b.real+a.imag*b.imag)/(b.real^2+b.imag^2),
                                            (a.imag*b.real-a.real*b.imag)/(b.real^2+b.imag^2))
Base.:≈(a::ComplexNumber,b::ComplexNumber) = (a.real ≈ b.real) && (a.imag ≈ b.imag)
Base.:(==)(a::ComplexNumber,b::ComplexNumber) = (a.real == b.real) && (a.imag == b.imag)
Base.abs(a::ComplexNumber) = sqrt(a.real^2+a.imag^2)
Base.conj(a::ComplexNumber) = ComplexNumber(a.real,-a.imag)
Base.real(a::ComplexNumber) = a.real
Base.imag(a::ComplexNumber) = a.imag
Base.exp(a::ComplexNumber) = ComplexNumber(exp(a.real)*cos(a.imag),exp(a.real)*sin(a.imag))
Base.zero(::ComplexNumber)  = ComplexNumber(0.,0.)