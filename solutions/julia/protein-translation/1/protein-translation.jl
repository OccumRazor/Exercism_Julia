const codon2amino = Dict("AUG"=>"Methionine","UUU"=>"Phenylalanine","UUC"=>"Phenylalanine",
                            "UUA"=>"Leucine","UUG"=>"Leucine","UCU"=>"Serine","UCC"=>"Serine",
                            "UCA"=>"Serine","UCG"=>"Serine","UAU"=>"Tyrosine", "UAC"=>"Tyrosine",
                            "UGU"=>"Cysteine", "UGC"=>"Cysteine","UGG"=>"Tryptophan")
const stops = ["UAA","UAG","UGA"]

function proteins(strand::String)
    codons = [strand[i:i+2] for i in 1:3:length(strand)-2]
    if length(strand) % 3 != 0
        if !any([s∈codons for s in stops])
            throw(DomainError(strand,"Strand $strand is not complete."))
        end
    end
    ps = Vector{String}()
    ks = keys(codon2amino)
    for codon in codons
        if codon ∈ stops
            break
        elseif codon ∈ ks
            push!(ps,codon2amino[codon])
        else
            throw(DomainError(codon,"Codon $codon is not valid."))
        end
    end
    return ps
end
