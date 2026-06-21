const misc_char = Set(["",' ','\t','\n','\r'])
R = ["Sure.","Whoa, chill out!","Fine. Be that way!","Whatever.","Calm down, I know what I'm doing!",]

all_cap(s::String) = all([isuppercase(letter) for letter in s if isletter(letter)]) &&length([isuppercase(letter) for letter in s if isletter(letter)]) > 0
all_misc(s::String) = issubset(Set(collect(s)),misc_char)
end_with_question(s::String) = last(String([i for i in collect(s) if !(i∈misc_char)])) == '?'


function bob(stimulus::String)
    if all_misc(stimulus) return R[3] end
    if all_cap(stimulus)
        if end_with_question(stimulus)
            return last(R)
        end
        return R[2]
    end
    if end_with_question(stimulus) return R[1] end
    return R[4]
end
