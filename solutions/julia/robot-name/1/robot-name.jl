used_names = Set{String}()
const p1 = [Char(i) for i ∈ 65:90]
const p2 = [Char(i) for i ∈ 48:57]

mutable struct Robot
    name::String
    function Robot()
        name = gen_name()
        new(name)
    end
end

function gen_name()
    name  = rand(p1) * rand(p1) * rand(p2) * rand(p2) * rand(p2)
    while name ∈ used_names
        name  = rand(p1) * rand(p1) * rand(p2) * rand(p2) * rand(p2)
    end
    push!(used_names,name)
    return name
end

function reset!(instance::Robot)
    instance.name = gen_name()
end

function name(instance::Robot)
    return instance.name
end
