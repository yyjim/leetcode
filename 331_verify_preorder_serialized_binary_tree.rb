# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
    nodes = preorder.split(',')
    num_leaves = 0
    num_node   = 0
    i = 0
    # The full binary tree should satisfy
    # number of leaves == number of nodes + 1
    nodes.each do |node|
        i += 1
        if (node == "#") 
            num_leaves += 1
        else
            num_node += 1
        end
        if num_node + 1 == num_leaves
            break
        end
    end
    return num_node + 1 == num_leaves && i == nodes.size;
end