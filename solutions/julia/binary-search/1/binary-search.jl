# Change any of the following NamedTuple values to true to 
# enable testing different bonus tasks
#tested_bonus_tasks = (rev = false, by = false, lt = false, multiple_matches = false)

function binarysearch(pool::Vector,n)
    if length(pool) == 0
        return 1:0
    end
    p0 = 1
    p2 = length(pool)
    p1 = floor(Int,(p0+p2)/2)
    while pool[p1] != n
        if pool[p1] > n
            p2 = p1
        else
            p0 = p1
        end
        p1 = floor(Int,(p0+p2)/2)
        if p2 - p0 == 1
            if pool[p0] < n < pool[p2]
                return p2:p0
            elseif pool[p0] == n
                return p0:p0
            elseif pool[p2] == n
                return p2:p2
            elseif pool[p0] > n
                return p0:p0-1
            elseif pool[p2] < n
                return p2+1:p2
            else
                break
            end
        end
        if p2 == p0
            if pool[p0] > n
                return 1:0
            elseif last(pool) < n
                return length(pool):length(pool)+1
            end
        end
    end
    return p1:p1
end