function Base.iseven(msg::String)
    return iseven(length(filter(x->x=='1',msg)))
end

function get_transmit_sequence(message::Vector{UInt8})
    text = Vector{UInt8}()
    carrier::String = ""
    for i ∈ eachindex(message)
        msg = bitstring(message[i])
        lc = length(carrier)
        if lc == 7
            if iseven(carrier) carrier *= "0"
            else carrier *= "1" end
            push!(text,parse(UInt8,carrier;base=2))
            carrier = ""
            lc = 0
        end            
        carrier *= msg[1:7 - lc]
        if iseven(carrier) carrier *= "0"
        else carrier *= "1" end
        push!(text,parse(UInt8,carrier;base=2))
        carrier = msg[8 - lc:8]
    end
    if length(carrier) > 0
        carrier *= ("0"^(7-length(carrier)))
        if iseven(carrier) carrier *= "0"
        else carrier *= "1" end
        push!(text,parse(UInt8,carrier;base=2))
    end
    return text
end

function get_transmit_sequence(message::Vector{Any})
    return []
end


function decode_sequence(received_seq::Vector{UInt8})
    text = Vector{UInt8}()
    carrier = ""
    for i ∈ eachindex(received_seq)
        msg = bitstring(received_seq[i])
        if !iseven(msg)
            throw(ErrorException(""))
        end
        carrier *= msg[1:7]
    end
    for i ∈ 1:floor(Int,length(carrier)/8)
        push!(text,parse(UInt8,carrier[(i-1)*8+1:i*8];base=2))
    end
    return text
end

function decode_sequence(received_seq::Vector{Any})
    return []
end