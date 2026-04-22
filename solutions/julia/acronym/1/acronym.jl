function acronym(phrase)
    p = replace(phrase,"-"=>" ","_"=>"")
    ps = split(p," ")
    ps = [ps[i][1] for i in eachindex(ps) if ps[i]!=""]
    return uppercase(join(ps,""))
end
