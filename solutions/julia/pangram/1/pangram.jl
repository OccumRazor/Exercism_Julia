"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    ipts = collect(uppercase(input))
    letters = Vector{Char}()
    for ipt in ipts
        if !(ipt ∈ letters) && (65 ≤ Int(ipt) ≤ 90)
            push!(letters,ipt)
            if length(letters) == 26
                return true
            end
        end
    end
    return false
end

