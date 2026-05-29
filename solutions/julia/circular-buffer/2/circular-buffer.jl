mutable struct CircularBuffer{T}<:AbstractVector{T}
    old_id::Union{Nothing,Int}
    last_id::Int
    buffer::Vector{T}
    slots::Integer
    function CircularBuffer{T}(capacity::Integer) where {T}
        old_id = nothing
        last_id = 1
        buffer = Vector{T}()
        slots = capacity
        new(old_id,last_id,buffer,slots)
    end
end

function capacity(cb::CircularBuffer)
    return cb.slots
end

function Base.length(cb::CircularBuffer)
    return length(cb.buffer)
end

function Base.size(cb::CircularBuffer)
    return (length(cb),)
end

function isfull(cb::CircularBuffer)
    return length(cb.buffer) == cb.slots
end

function Base.collect(cb::CircularBuffer)
    return collect(cb.buffer)
end

function Base.isempty(cb::CircularBuffer)
    return isempty(cb.buffer)
end

function Base.eltype(cb::CircularBuffer)
    return eltype(cb.buffer)
end

function Base.first(cb::CircularBuffer)
    if isnothing(cb.old_id)
        throw(BoundsError(cb.buffer,[0]))
    else
        return cb.buffer[cb.old_id]
    end
end

function Base.last(cb::CircularBuffer)
    if isnothing(cb.last_id)
        throw(BoundsError(cb.buffer,[0]))
    else
        return cb.buffer[cb.last_id]
    end
end


function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    if isnothing(cb.old_id)
        push!(cb.buffer,item)
        cb.old_id = 1
    elseif length(cb) < cb.slots
        push!(cb.buffer,item)
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

function Base.push!(cb::CircularBuffer, items::UnitRange; overwrite::Bool=false)
    for i in items
        push!(cb,i,overwrite)
    end
end

function Base.popfirst!(cb::CircularBuffer)
    if isnothing(cb.old_id)
        throw(BoundsError(cb.buffer,[100]))
    elseif isempty(cb)
        throw(BoundsError(cb.buffer,[10000]))
    end
    return_value = cb.buffer[cb.old_id]
    deleteat!(cb.buffer,cb.old_id)
    if length(cb) == 0
        cb.old_id = nothing
    elseif length(cb) < cb.old_id
        cb.old_id = 1
    end
    if cb.last_id > length(cb) cb.last_id = length(cb) end
    return return_value
end

function Base.empty!(cb::CircularBuffer)
    cb.old_id = nothing
    cb.last_id = 1
    empty!(cb.buffer)
    return cb
end

function Base.getindex(cb::CircularBuffer,k)
    return cb.buffer[k]
end

function Base.setindex!(cb::CircularBuffer,v,k)
    cb.buffer[k] = v
end