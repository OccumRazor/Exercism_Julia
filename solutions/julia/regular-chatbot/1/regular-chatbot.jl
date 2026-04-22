function is_valid_command(msg)
    m = match(r"(chatbot)"i,msg)
    if isnothing(m)
        return false
    end
    if m.offsets isa Vector
        start = m.offsets[1]
    else
        start = m.offsets
    end
    if start == 1
        return true
    else
        return false
    end
end

function remove_emoji(msg)
    msg = replace(msg,r"(emoji)\d+"=>"")
    return msg
end

function check_phone_number(number)
    pattern = r"\(\+\d\d\) \d\d\d-\d\d\d-\d\d\d"
    m = match(pattern,number)
    if isnothing(m)
        return "Oops, it seems like I can't reach out to $(number)"
    else
        return "Thanks! You can now download me to your phone."
    end
end


function getURL(msg)
    pattern = r"(\w+)\.(\w+)"
    matches = eachmatch(pattern,msg)
    return  [m.match for m in matches]
end

function nice_to_meet_you(str)
    pattern = r"(\w+)"
    matches = eachmatch(pattern,str)
    u_name = [m.match for m in matches]
    u_name = uppercasefirst.(u_name)
    return "Nice to meet you, $(u_name[2]) $(u_name[1])"
end
