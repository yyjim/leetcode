#!/usr/bin/env ruby
# The title format "{Number}. {Title}. {Difficulty}"
# eg ./bin/title_to_readme.rb "153. Find Minimum in Rotated Sorted Array. Medium"

def title_to_readme titles
  titles.each do |t|
    t.lstrip.strip =~ /^(\d+)\.\s+(.+)\.\s+(\w+)$/
    number = $1
    title = $2.strip
    difficulty = $3
    filename = "#{number}_#{title.gsub(/\s/, "_").downcase}"
    readme = <<-README
|#{number}|[#{title}](./problems/#{filename}.md)|[Ruby](./algorithms/ruby/#{filename}.rb)|#{difficulty}|
    README
    puts readme
  end
end
title_to_readme(ARGV)
