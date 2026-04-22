function message(msg)
    info = msg[findfirst(":",msg)[1]+1:length(msg)]
    return strip(info)
end

function log_level(msg)
    return lowercase(msg[findfirst("[",msg)[1]+1:findfirst("]",msg)[1]-1])
end

function reformat(msg)
    info_type = log_level(msg)
    info_content = message(msg)
    return "$(info_content) ($(info_type))"
end
