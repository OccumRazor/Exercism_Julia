const plant = Dict('G'=>"grass",'C'=>"clover",'R'=>"radishes",'V'=>"violets")

function plants(diagram::String, student::String)
    num = Int(student[1]) - 64
    plants = split(diagram,'\n')
    results = Vector{String}()
    for i in 1:2
        for j in 2num-1:2num
            push!(results,plant[plants[i][j]])
        end
    end
    return results
end
