function onEarth(seconds::Int)
    return seconds / 31_557_600
end

function onMercury(seconds::Int)
    return onEarth(seconds) / 0.2408467
end

function onVenus(seconds::Int)
    return onEarth(seconds) / 0.61519726
end

function onMars(seconds::Int)
    return onEarth(seconds) / 1.8808158
end

function onJupiter(seconds::Int)
    return onEarth(seconds) / 11.862615
end

function onSaturn(seconds::Int)
    return onEarth(seconds) / 29.447498
end

function onUranus(seconds::Int)
    return onEarth(seconds) / 84.016846
end

function onNeptune(seconds::Int)
    return onEarth(seconds) / 164.79132
end