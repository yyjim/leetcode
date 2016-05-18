# 331. Verify Preorder Serialization of a Binary Tree
https://leetcode.com/problems/verify-preorder-serialization-of-a-binary-tree/

One way to serialize a binary tree is to use pre-order traversal. When we encounter a non-null node, we record the node's value. If it is a null node, we record using a sentinel value such as #.

```
     _9_
    /   \
   3     2
  / \   / \
 4   1  #  6
/ \ / \   / \
# # # #   # #
```

For example, the above binary tree can be serialized to the string "9,3,4,#,#,1,#,#,2,#,6,#,#", where # represents a null node.

Given a string of comma separated values, verify whether it is a correct preorder traversal serialization of a binary tree. Find an algorithm without reconstructing the tree.

Each comma separated value in the string must be either an integer or a character '#' representing null pointer.

You may assume that the input format is always valid, for example it could never contain two consecutive commas such as "1,,3".

Example 1:
"9,3,4,#,#,1,#,#,2,#,6,#,#"
Return true

Example 2:
"1,#"
Return false

## Solutions
###[Ruby](./algorithms/331_verify_preorder_serialized_binary_tree.rb)

```Ruby
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
```
