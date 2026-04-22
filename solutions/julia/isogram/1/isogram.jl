function isisogram(s)
    sp = replace(s," "=>"")
    sp = replace(sp,"-"=>"")
    sp = lowercase(sp)
    letters = Set(collect(sp))
    return length(letters) == length(sp)
end
