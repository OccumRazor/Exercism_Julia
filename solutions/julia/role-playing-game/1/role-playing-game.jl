StringOrMissing = Union{String,Missing} # type union definition
IntOrNothing = Union{Int64,Nothing}# type union definition

@kwdef mutable struct Player
    name::StringOrMissing = missing
    level::Int64 = 0
    health::Int64 = 100
    mana::IntOrNothing = nothing
end

u_name(n::String) = n
u_name(n::Missing) = "Mighty Magician"

function introduce(player::Player)
    return u_name(player.name)
end

function increment(mana::IntOrNothing)
    if isnothing(mana)
        return 50
    else
        return mana + 100
    end
end

function increment(name::StringOrMissing)
    if ismissing(name)
        return "The Great"
    else
        return "$(name) the Great"
    end
end

function title!(player::Player)
    if player.level == 42
        player.name = increment(player.name)
    end
    return player.name
end

function revive!(player::Player)
    if player.health == 0
        player.health = 100
        player.mana = increment(player.mana)
    end
    return player
end
