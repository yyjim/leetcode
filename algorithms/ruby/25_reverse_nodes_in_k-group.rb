# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end

    def to_s
      node = self
      s = ""
      while node do
        s << "#{node.val}"
        s << " -> " if node.next
        node = node.next
      end
      s
    end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}

def reverse_k_group(head, k)
    return head if k < 2
    result = ListNode.new(999)
    result.next = head
    group_ahead_node = result
    start_node = cur_node = head

    j = 0
    while cur_node do
      j += 1
      if j == 1
        start_node = cur_node
        cur_node = cur_node.next
      elsif j == k
        cur_node = start_node.next
        while j > 1 do
          # Remeber next node
          next_node = cur_node.next

          # Swap nodes
          cur_node.next = group_ahead_node.next
          group_ahead_node.next = cur_node
          start_node.next = next_node
          cur_node = next_node
          j -= 1
        end
        group_ahead_node = start_node
        j = 0
      else
        cur_node = cur_node.next if cur_node
      end
    end
    return result.next
end

head = node = ListNode.new(999)
[1, 2, 3, 4, 5, 6].each do |val|
  node.next = ListNode.new(val)
  node = node.next
end
head = head.next
k = 3
puts "reverse #{k} group: #{head.to_s}"
result = reverse_k_group(head.dup, k)
puts "result: #{result.to_s}"

# Testing code
# def reverse_value(head)
#   node = head
#   prev_node = nil
#   while true do
#     next_node = node.next
#     next_next_node = next_node.next
#
#     node.next = prev_node
#     next_node.next = node
#
#     prev_node = next_node
#     node = next_next_node
#     break if next_next_node == nil
#     node = next_next_node
#   end
#   return prev_node
# end
