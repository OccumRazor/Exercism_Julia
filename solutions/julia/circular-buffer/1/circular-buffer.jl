mutable struct CircularBuffer{T}
    old_id::Union{Nothing,Int}
    last_id::Int
    buffer::Vector{Union{Nothing,T}}
    slots::Integer
    function CircularBuffer{T}(capacity::Integer) where {T}
        old_id = nothing
        last_id = 1
        buffer = Vector{Union{Nothing,T}}(nothing,capacity)
        slots = capacity
        new(old_id,last_id,buffer,slots)
    end
end

function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    if isnothing(cb.old_id)
        cb.buffer[1] = item
        cb.last_id = 1
        cb.old_id = 1
    elseif isnothing(cb.buffer[(cb.last_id%cb.slots)+1])
        cb.buffer[(cb.last_id%cb.slots)+1] = item
        cb.last_id = (cb.last_id % cb.slots) + 1
    else
        if overwrite
            cb.buffer[cb.old_id] = item
            cb.last_id = cb.old_id
            cb.old_id = (cb.old_id % cb.slots) + 1
        else
            throw(BoundsError(cb.buffer,[cb.last_id]))
        end
    end
    return cb
end

function Base.popfirst!(cb::CircularBuffer)
    if isnothing(cb.old_id)
        throw(BoundsError(cb.buffer,[100]))
    end
    if all([isnothing(content) for content in cb.buffer])
        throw(BoundsError(cb.buffer,[10000]))
    end
    return_value = cb.buffer[cb.old_id]
    cb.buffer[cb.old_id] = nothing
    cb.old_id = (cb.old_id % cb.slots) + 1
    return return_value
end

function Base.empty!(cb::CircularBuffer)
    cb.old_id = nothing
    cb.last_id = 1
    for i in 1:cb.slots
        cb.buffer[i] = nothing
    end
    return cb
end
