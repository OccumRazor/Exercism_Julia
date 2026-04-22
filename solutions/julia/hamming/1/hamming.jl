"Your optional docstring here"
function distance(a, b)
    if length(a) != length(b)
        throw(ArgumentError("Length of two sequences should be equal"))
    end
    return length([1 for (ai,bi) in zip(collect(a),collect(b)) if ai != bi])
end
