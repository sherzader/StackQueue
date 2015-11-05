
def my_min(array)
  return array.first if array.size < 2

  min = nil
  array.each do |num|
    if min.nil? || num < min
      min = num
    end
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(list)
  current_sum = 0
  max_sum = 0

  list.each do |el|
    current_sum += el
    if current_sum > max_sum
      max_sum = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end
  max_sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
#worst-case O(n^2) if not more


def first_anagram?(word1, word2)
  all_anags = word1.chars.permutation(word1.length).to_a
  all_anags.map!(&:join)
  all_anags.include? word2
end

def second_anagram?(word1, word2)
  word1.each_char.with_index do |letter, i|
    if word2.include? letter
      word1.delete! letter
      word2.delete! letter
    end
  end
  word1.empty? && word2.empty?
end


def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1, word2)
  ana = Hash.new(){ |h,k| h[k] = 0 }

  word1.each_char do |ch|
    ana[ch] += 1
  end

  word2.each_char do |ch|
    ana[ch] += 1
  end

  ana.keys.length == word1.length
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true
