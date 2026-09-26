using Base

mutable struct Tree
    root::String
    left::Union{Tree, Nothing}
    right::Union{Tree, Nothing}
end

function search(inorder::Vector{String},target_val::String,left::Int,right::Int)
    for i ∈ left:right
        if inorder[i] == target_val
            return i
        end
    end
    return -1
end

function travel(preorder::Vector{String}, inorder::Vector{String},pre_index::Int,left_index::Int,right_index::Int)
    if left_index > right_index
        return nothing
    end
    root_val = preorder[pre_index]
    pre_index += 1
    tree = Tree(root_val,nothing,nothing)
    index = search(inorder,root_val,left_index,right_index)
    tree.left = travel(preorder,inorder,pre_index,left_index,index-1)
    tree.right = travel(preorder,inorder,pre_index,index+1,right_index)
    return tree
end

function tree_from_traversals(preorder::Vector{String}, inorder::Vector{String})
    if length(preorder) != length(inorder) || Set(preorder) != Set(inorder) || length(preorder) != length(Set(preorder))
        throw(ArgumentError(""))
    end
    if length(preorder) == 0 return nothing end
    return travel(preorder,inorder,1,1,length(preorder))
end

Base.:(==)(tree1::Tree,tree2::Tree) = (tree1.root == tree2.root) && (
                                        tree1.left == tree2.left) && (
                                        tree1.right == tree2.right)
