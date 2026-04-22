function humiditycheck(pct_humidity)
    if pct_humidity ≤ 70
        @info "humidity level check passed: $(pct_humidity)%"
    else
        throw(error("humidity check failed: $(pct_humidity)%"))
    end
end

function temperaturecheck(temperature)
    if isnothing(temperature)
        throw(ArgumentError("sensor is broken"))
    elseif temperature > 500
        throw(DomainError(temperature,"overheating detected $(temperature)"))
    else
        @info "temperature check passed: $(temperature) °C"
    end
end

# define MachineError here
struct MachineError<:Exception

end

function machinemonitor(pct_humidity, temperature)
    n_error = 0
    try
        humiditycheck(pct_humidity)
    catch problem
        if problem isa ErrorException
            @error "humidity level check failed: $(pct_humidity)%"
            n_error += 1
        end
    end
    try 
        temperaturecheck(temperature)
    catch problem
        if problem isa ArgumentError
            @warn "sensor is broken"
            n_error += 1
        elseif problem isa DomainError
            @error "overheating detected: $(temperature) °C"
            n_error += 1
        end
    end
    if n_error > 0
        throw(MachineError())
    end
end
