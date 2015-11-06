require_relative 'our_stack'

class StackQueue

  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(*pancakes)
    pancakes.each do |pancake|
      @in_stack.push(pancake)
    end
    @in_stack.max
  end

  def flip
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end

  def dequeue
    if @out_stack.empty? && !@in_stack.empty?
      flip
    end

    @out_stack.pop
  end

  def size
    @in_stack.size + @out_stack.size
  end
end

def max_window_range(arr, window)
  max_range = nil
  windows_qty = arr.length - (window - 1)
  windows_qty.times do |start_pos|
    window_slice = arr.slice(start_pos...start_pos + window)
    a_range = window_slice.max - window_slice.min
    if max_range.nil? || a_range > max_range
      max_range = a_range
    end
  end
  max_range
end

p jerald = PancakeBouncer.new
p jerald.enqueue(*[1, 0, 2, 5, 4, 8])
p jerald.size
p jerald.dequeue
p jerald.size
