function rationalize(successes, trials)
    return [successes[i]//trials[i] for i in eachindex(successes)]
end

function probabilities(successes, trials)
    return [successes[i]/trials[i] for i in eachindex(successes)]
end

function checkmean(successes, trials)
    pr = sum(rationalize(successes,trials)) / length(successes)
    pp = sum(probabilities(successes,trials)) / length(successes)
    if pp == float(pr)
        return true
    else
        return pr
    end
end

function checkprob(successes, trials)
    pr = 1
    pp = 1
    for i in eachindex(successes)
        pp *= successes[i] / trials[i]
        pr *= successes[i] // trials[i]
    end
    if pp == float(pr)
        return true
    else
        return pr
    end
end

