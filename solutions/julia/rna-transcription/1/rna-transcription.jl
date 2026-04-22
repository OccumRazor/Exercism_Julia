const partner = Dict('A'=>'U','T'=>'A','G'=>'C','C'=>'G')
const legit = Set(['A','T','G','C'])
function to_rna(dna)
    DNA = collect(dna)
    if length(setdiff(Set(DNA),legit)) != 0
        throw(ErrorException("Unexpected key in the DNA sequence"))
    end
    return String([
        partner[DNA[i]] for i in eachindex(DNA)
    ])
end

