function print_name_badge(id, name, department)
    if ismissing(id)
        id = ""
    else
        id = "[" * string(id) * "] - "
    end
    if isnothing(department)
        department = "OWNER"
    else
        department = uppercase(department)
    end
    return id * name * " - " * department
end

function salaries_no_id(ids, salaries)
    return sum(salaries .* ismissing.(ids))
end
