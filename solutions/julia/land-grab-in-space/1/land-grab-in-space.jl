# define the Coord type
struct Coord
    x::UInt16
    y::UInt16
end
# define the Plot keyword type
@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

function sg_overlap(claim::Plot,land::Plot)
    l_c = [claim.bottom_left.x,claim.top_right.x]
    l_l = [land.bottom_left.x,land.top_right.x]
    h_c = [claim.bottom_left.y,claim.top_right.y]
    h_l = [land.bottom_left.y,land.top_right.y]
    k1 = (l_l[1] ≤ l_c[1] ≤ l_l[2]) || (l_l[1] ≤ l_c[1] ≤ l_l[2])
    k2 = (h_l[1] ≤ h_c[1] ≤ h_l[2]) || (h_l[1] ≤ h_c[1] ≤ h_l[2])
    if k1 && k2
        return true
    else
        return false
    end
end

function is_claim_staked(claim::Plot, register::Set{Plot})
    for land in register
        if sg_overlap(claim,land)
            return true
        end
    end
    return false
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if is_claim_staked(claim,register)
        return false
    else
        push!(register,claim)
        return true
    end
end

function get_longest_side(claim::Plot)
    len = claim.top_right.x - claim.bottom_left.x
    height = claim.top_right.y - claim.bottom_left.y
    return max(len,height)
end

function get_claim_with_longest_side(register::Set{Plot})
    l_set = Set{Plot}()
    max_side = 0
    for land in register
        side = get_longest_side(land)
        if side > max_side
            max_side = side
            empty!(l_set)
            push!(l_set,land)
        elseif side == max_side
            push!(l_set,land)
        end
    end
    return l_set
end
