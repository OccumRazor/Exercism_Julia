function recite(pieces)
    if length(pieces) == 0
        return ""
    elseif length(pieces) == 1
        return "And all for the want of a $(pieces[1])."
    end
    text = ""
    for i in 1:length(pieces)-1
        text *= "For want of a $(pieces[i]) the $(pieces[i+1]) was lost.\n"
    end
    text *= "And all for the want of a $(pieces[1])."
    return text
end
