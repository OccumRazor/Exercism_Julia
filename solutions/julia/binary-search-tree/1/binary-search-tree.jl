# Create a (Mutable) Struct BinarySearchTree, which has fields: data, left, right
# Three methods for accessing the fields have been provided to be used in testing
# Your BinarySearchTree should support the extra functionality seen in the tests
using Base
mutable struct BinarySearchTree
    data::Union{Nothing,Int}
    left::Union{Nothing,BinarySearchTree}
    right::Union{Nothing,BinarySearchTree}
    parent::Union{Nothing,BinarySearchTree}
end

nodedata(tree::BinarySearchTree) = tree.data
nodedata(tree::Nothing) = nothing
rightnode(tree::BinarySearchTree) = tree.right
leftnode(tree::BinarySearchTree) = tree.left

function Base.push!(tree::BinarySearchTree,digit::Int)
    node = tree
    last_node = node
    while !isnothing(node)
        last_node = node
        if digit ≤ nodedata(node)
            node = leftnode(node)
        else
            node = rightnode(node)
        end
    end
    if digit ≤ nodedata(last_node)
        last_node.left = BinarySearchTree(digit,nothing,nothing,last_node)
    else
        last_node.right = BinarySearchTree(digit,nothing,nothing,last_node)
    end
    return tree
end

function BinarySearchTree()
    return BinarySearchTree(nothing,nothing,nothing,nothing)
end

function BinarySearchTree(d::Int)
    return BinarySearchTree(d,nothing,nothing,nothing)
end

function BinarySearchTree(ds::Vector{Int})
    tree0 = BinarySearchTree(ds[1],nothing,nothing,nothing)
    for d ∈ ds[2:length(ds)]
        push!(tree0,d)
    end
    return tree0
end


function Base.:∈(d::Int,tree::BinarySearchTree)
    while !(isnothing(nodedata(tree)))
        if d < nodedata(tree)
            tree = leftnode(tree)
        elseif d > nodedata(tree)
            tree = rightnode(tree)
        else
            return true
        end
    end
    return false
end

function Base.sort(tree::BinarySearchTree)
    elements = Vector{Int}()
    if !isnothing(tree.left)
        append!(elements,sort(tree.left))
    end
    push!(elements,tree.data)
    if !isnothing(tree.right)
        append!(elements,sort(tree.right))
    end
    return elements
end

