const ops = ["wink","double blink","close your eyes","jump"]

function secret_handshake(code::Int)
    bin = bitstring(Int8(code))
    acts = Vector{String}()
    for i in 1:4
        if bin[9-i] == '1'
            push!(acts,ops[i])
        end
    end
    if bin[4] == '1'
        reverse!(acts)
    end
    return acts
end
