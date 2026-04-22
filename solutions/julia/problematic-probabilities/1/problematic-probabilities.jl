function rationalize(successes, trials)
    return [successes[i]//trials[i] for i in eachindex(successes)]
end

function probabilities(successes, trials)
    return [successes[i]/trials[i] for i in eachindex(successes)]
end

function checkmean(successes, trials)
    pr = sum(rationalize(successes,trials)) / length(successes)
    pp = sum(probabilities(successes,trials)) / length(successes)
    if pr == pp
        return true
    else
        return pr
    end
end

function checkprob(successes, trials)
    p1 = 1
    p2 = 1
    for i in eachindex(successes)
        p1 *= successes[i] / trials[i]
        p2 *= successes[i] // trials[i]
    end
    if p1 == p2
        return true
    else
        return p2
    end
end


successes, trials = [9, 8, 5, 4, 3], [22, 14, 19, 25, 18];
println(checkprob(successes,trials))