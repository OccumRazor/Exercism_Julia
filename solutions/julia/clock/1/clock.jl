using Dates

# define the Clock type
mutable struct Clock
    hour::Int
    minute::Int
    function Clock(h::Int,m::Int)
        h += floor(Int64,m/60)
        m = (m % 60)
        if m < 0
            m += 60
        end
        h = h % 24
        if h < 0
            h += 24
        end
        new(h,m)
    end
end

function show_time(c::Clock)
    H = string(c.hour)
    if c.hour < 10
        H = "0" * H
    end
    M = string(c.minute)
    if c.minute < 10
        M = "0" * M
    end
    return "\"$H:$M\""
end

Base.:+(c::Clock,m::Dates.Minute) = Clock(c.hour,c.minute + Dates.value(m))
Base.:-(c::Clock,m::Dates.Minute) = Clock(c.hour,c.minute - Dates.value(m))
Base.:(==)(c1::Clock,c2::Clock) = c1.hour == c2.hour && c1.minute == c2.minute
sprint(show,c::Clock) = show_time(c)