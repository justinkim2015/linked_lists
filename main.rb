# Full linked list
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    this_node = Node.new(value)
    if @head.nil?
      @head = this_node
    else
      current = @head
      current = current.next until current.next.nil?
      current.next = this_node
      @tail = this_node
    end
  end

  def prepend(value)
    this_node = Node.new(value)
    if @head.nil?
      @head = this_node
      @tail = this_node
    else
      this_node.next = @head
      @head = this_node
    end
  end

  def size
    current = @head
    count = 1
    until current.next.nil?
      count += 1
      current = current.next
    end
    puts "There are currently #{count} nodes"
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    current = @head
    i = 0
    unless index.zero?
      until i == index
        current = current.next
        i += 1
      end
    end
    current.value
  end

  def to_s
    current = @head
    until current.next.nil?
      print "( #{current.value} ) -> "
      current = current.next
    end
    print "( #{@tail.value} ) "
  end
end

# Each individual node
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

list = LinkedList.new
10.times do
  list.append(rand(10))
end

list.at(0)
