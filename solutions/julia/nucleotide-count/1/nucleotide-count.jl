"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    x = collect(strand)
    counts = Dict('A'=>0,'C'=>0,'G'=>0,'T'=>0)
    ks = ['A','C','G','T']
    for k in x
        if k in ks
            counts[k] += 1
        else
            throw(DomainError(k,"__________________________________________"))
        end
    end
    return counts
end
