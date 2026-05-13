import Base

const validSet = Set(['0','1','2','3','4','5','6','7','8','9','X'])

struct ISBN
    # Decide on how to represent an ISBN and on how to implement
    # the constructor.
    s::String
    n::Vector{Int8}
    function ISBN(str::String)
        s = str
        n = str2vector(str)
        isISBN(n)
        new(s,n)
    end
end

function str2vector(str::String)
    v = collect(join(split(str,"-"),""))
    if !issubset(Set(v),validSet) || 'X' ∈ v[1:length(v)-1]
        throw(DomainError(str,"$str is not a valid ISBN"))
    end
    return [i == 'X' ? Int8(10) : parse(Int8,i) for i ∈ v]
end

function isISBN(str::Vector{Int8})
    if length(str) != 10 || (sum([str[i] * (11-i) for i ∈ eachindex(str)]) % 11) != 0
        throw(DomainError(str,"$str is not a valid ISBN"))
    end
end

Base.:(==)(n1::ISBN,n2::ISBN) = n1.n == n2.n