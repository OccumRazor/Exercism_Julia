const value_dict = Dict("black"=>"0","brown"=>"1","red"=>"2","orange"=>"3","yellow"=>"4",
                        "green"=>"5","blue"=>"6","violet"=>"7","grey"=>"8","white"=>"9")

function colorcode(colors::Vector{String})
    return parse(Int,value_dict[colors[1]]*value_dict[colors[2]])
end
