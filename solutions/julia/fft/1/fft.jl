function dft(x::Vector{Float64})
    N = length(x)
    result = Vector{ComplexF64}(undef,N)
    for k ∈ 1:N
        result[k] = sum([
            x[n]*exp(-2im*π*(k-1)*(n-1)/N) for n ∈ 1:N
            ])
    end
    return result
end

function fft(x::Vector{Float64})
    N = length(x)
    if N == 1
        return x
    else
        result = Vector{ComplexF64}(undef,N)
        X_odd = fft(x[1:2:N])
        X_even = fft(x[2:2:N])
        for k ∈ 1:Int(N/2)
            E_k = X_odd[k]
            O_k = exp(-2im*π*(k-1)/N) * X_even[k]
            result[k] = E_k + O_k
            result[k+Int(N/2)] = E_k - O_k
        end
        return result
    end
end
