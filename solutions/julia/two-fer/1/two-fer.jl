function twofer(name::String = "")
    if name == ""
        return "One for you, one for me."
    end
    return "One for $name, one for me."
end
