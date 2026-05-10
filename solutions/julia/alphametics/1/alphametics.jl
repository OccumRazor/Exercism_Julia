include("permutations.jl")

function string2Dict!(ipt_string::String,value_Dict::Dict{Char,Int},sign::Int=1)
    len_str = length(ipt_string)
    for i ∈ eachindex(ipt_string)
        if ! haskey(value_Dict,ipt_string[i])
            value_Dict[ipt_string[i]] = sign * 10^(len_str - i)
        else
            value_Dict[ipt_string[i]] += sign * 10^(len_str - i)
        end
    end
end

function gen_Eq(lhs::Vector{String},rhs::String)
    Dict_L = Dict{Char,Int}()
    for i ∈ eachindex(lhs)
        string2Dict!(lhs[i],Dict_L)
    end
    Dict_R = Dict{Char,Int}()
    string2Dict!(rhs,Dict_R,-1)
    merge!(+,Dict_L,Dict_R)
end

function satisfies(candidate::Dict{Char,Int},dict_eq::Dict{Char,Int})
    return sum([candidate[l] * dict_eq[l] for l ∈ collect(keys(candidate))]) == 0
end

function search_space(dict_all::Dict{Char,Int},leading_leters::Vector{Char})
    letters = collect(keys(dict_all))
    ps = permutations(collect(0:9),length(letters))
    for p ∈ ps
        result = Dict{Char,Int}()
        for i ∈ eachindex(p)
            result[letters[i]] = p[i]
        end
        if satisfies(result,dict_all)
            if all([result[l]!=0 for l ∈ leading_leters])
                return result
            end
        end
    end
    return nothing
end

function solve(input_string::String)
    lhs,rhs = split(input_string,"==")
    lhs = split(lhs,'+')
    rhs = filter(x->x!=' ',rhs)
    lhs = [filter(x->x!=' ',lhs[i]) for i ∈ eachindex(lhs)]
    leading_letters = [lhs[i][1] for i ∈ eachindex(lhs)]
    push!(leading_letters,rhs[1])
    dict_all = gen_Eq(lhs,rhs)
    return search_space(dict_all,leading_letters)
end
