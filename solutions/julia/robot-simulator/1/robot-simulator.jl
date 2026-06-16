# define the Robot type
NORTH = "NORTH"
SOUTH = "SOUTH"
EAST = "EAST"
WEST = "WEST"
directions = [NORTH,EAST,SOUTH,WEST]

mutable struct Point
    x::Int
    y::Int
end
Base.:(==)(p0::Point,p1::Point) = p0.x == p1.x && p0.y == p1.y
moves = Dict(NORTH=>Point(0,1),SOUTH=>Point(0,-1),EAST=>Point(1,0),WEST=>Point(-1,0))

mutable struct Robot
    position::Point
    heading::String
    function Robot(x::Tuple{Int,Int},heading::String)
        position = Point(x[1],x[2])
        heading = heading
        new(position,heading)
    end
end

Base.:(==)(r0::Robot,r1::Robot) = r0.position == r1.position && r0.heading == r1.heading

position(r::Robot) = r.position
heading(r::Robot) = r.heading
function turn_right!(r::Robot)
    r.heading = directions[(findfirst(x->x==r.heading,directions) % 4) + 1]
    return r
end

function turn_left!(r::Robot)
    L = findfirst(x->x==r.heading,directions)
    r.heading = directions[L == 1 ? 4 : L - 1]
    return r
end

Base.:+(p1::Point,p2::Point) = Point(p1.x+p2.x,p1.y+p2.y)

function advance!(r::Robot)
    r.position += moves[r.heading]
    return r
end

function move!(r::Robot,instructions::String)
    for order ∈ collect(instructions)
        if order == 'A'
            advance!(r)
        elseif order == 'R'
            turn_right!(r)
        else
            turn_left!(r)
        end
    end
    return r
end