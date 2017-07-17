
def ladder_length(begin_word, end_word, word_list)
  #ladder_length_one_way(begin_word, end_word, word_list)
  ladder_length_two_way(begin_word, end_word, word_list)
end

def ladder_length_one_way(begin_word, end_word, word_list)
  return 0 unless word_list.include? end_word
  length = begin_word.size  
  word_dict = word_list.inject({}) do |dict, word|
      dict[word] = 0
      dict
  end
  queue = { begin_word => 1 }
  distance = 1;
  until queue[end_word] do      
    next_queue = {}
    queue.keys.each do |word|
        chars = word.split("")
        (0..length).each do |i|
            old = chars[i]
            ("a".."z").each do |c|
                chars[i] = c
                new_word = chars.join
                if word_dict[new_word] == 0
                  next_queue[new_word] = 1 
                  word_dict[new_word] = 1
                end
            end
            chars[i] = old
        end
    end
    return 0 if next_queue.empty?
    queue = next_queue
    distance += 1
  end    
  return distance
end

def ladder_length_two_way(begin_word, end_word, word_list)
  return 0 unless word_list.include? end_word
  length = begin_word.size  
  word_dict = word_list.inject({}) do |dict, word|
      dict[word] = 0
      dict
  end
  queue_start = { begin_word => 1 }
  queue_end = { end_word => 1}
  distance = 1
  while !queue_start.keys.empty? && !queue_end.keys.empty?
    if queue_start.size > queue_end.size
      queue_start, queue_end = queue_end, queue_start
    end
    next_queue = {}
    queue_start.keys.each do |word|
        chars = word.split("")
        (0..length).each do |i|
          old = chars[i]
          ("a".."z").each do |c|
              chars[i] = c
              new_word = chars.join
              
              return distance + 1 if queue_end[new_word]
              
              if word_dict[new_word] == 0
                  next_queue[new_word] = 1 
                  word_dict[new_word] = 1
              end
          end
          chars[i] = old
        end
    end
    queue_start = next_queue
    distance += 1
  end
  return 0 
end

begin_word, end_word, word_list = "hit", "hog", ["hoi", "hog"]
begin_word, end_word, word_list = "a", "c", ["a", "b", "c"]
begin_word, end_word, word_list = "hit", "cog", ["hot","dot","dog","lot","log","cog"]
begin_word, end_word, word_list = "leet", "code", ["lest","leet","lose","code","lode","robe","lost"]
puts ladder_length begin_word, end_word, word_list

