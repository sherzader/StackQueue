
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
  sub_sum_sets = []

  list.length.times do |start_pos|
    (1..list.length - start_pos).each do |len|
      sub_sum_sets << list[start_pos...start_pos + len]
      p sub_sum_sets
    end
  end

  sums = sub_sum_sets.map do |sub_set|
    sub_set.inject(:+)
  end
  sums.max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
#worst-case O(n^2) if not more
