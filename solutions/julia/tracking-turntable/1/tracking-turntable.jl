function z(x, y)
    return complex(x,y)
end

function euler(r, θ)
    return r * cis(θ)
end

function rotate(x, y, θ)
    c = z(x,y) * euler(1,θ)
    return (real(c),imag(c))
end

function rdisplace(x, y, r)
    c = euler((abs(z(x,y)) + r),angle(z(x,y)))
    return (real(c),imag(c))
end

function findsong(x, y, r, θ)
    x1,y1 = rdisplace(x,y,r)
    xp,yp = rotate(x1,y1,θ)
    return (xp,yp)
end
