# The new_school() function must return something that can be used in
# all the other functions.
# Programmers are free to choose a suitable implementation.

Student = NamedTuple{(:name, :grade), Tuple{String, Int}}

mutable struct School
    students::Vector{String}
    grades::Vector{Int}
end

function school_sort!(school::School)
    sorted_students = Vector{String}()
    sorted_grades = Vector{Int}()
    for i in 1:7
        locs = findall(x->x==i,school.grades)
        append!(sorted_grades,school.grades[locs])
        append!(sorted_students,sort!(school.students[locs]))
    end
    school.students = sorted_students
    school.grades = sorted_grades
end

function new_school()
    return School([],[])
end

function add!(students, school::School)
    register = Vector{Bool}()
    for student in students
        if student.name ∈ school.students
            push!(register,false)
        else
            push!(school.students,student.name)
            push!(school.grades,student.grade)
            push!(register,true)
        end
    end
    school_sort!(school)
    return register
end

function grade(num::Int, school::School)
    return school.students[findall(x->x==num,school.grades)]
end

function roster(school::School)
    return school.students
end
