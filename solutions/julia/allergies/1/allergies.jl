const scores = Dict("eggs"=>1,"peanuts"=>2,"shellfish"=>3,
                    "strawberries"=>4,"tomatoes"=>5,"chocolate"=>6,"pollen"=>7,"cats"=>8)

function allergic_to(score, allergen)
    b_dict = digits(score, base=2, pad=16)
    if b_dict[scores[allergen]] == 1
        return true
    else
        return false
    end
end

function allergy_list(score)
    b_dict = digits(score, base=2, pad=16)
    alls = ["eggs","peanuts","shellfish","strawberries","tomatoes","chocolate","pollen","cats"]
    allergens = Vector{String}()
    for i in 1:8
        if b_dict[i] == 1
            push!(allergens,alls[i])
        end
    end
    return Set(allergens)
end
