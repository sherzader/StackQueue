class MyStack
  # attr_reader :heaviest_pancake

  def initialize
    @store = []
  end

  def push(obj)
    min = obj unless @store.peek[min] < obj
    max = obj unless @store.peek[max] > obj
    # if @heaviest_pancake.nil? || obj > @heaviest_pancake
    #   @heaviest_pancake = obj
    # end
    @store.push({obj: obj, min: min, max: max })
  end

  def pop
    @store.pop
  end

  def peek
    raise "there is nothing to peek at, you peeker!" if self.empty?
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end
