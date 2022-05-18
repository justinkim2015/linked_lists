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

  def pop
    current = @head
    until current.next.nil?
      second_last = current
      current = current.next
    end
    second_last.next = nil
    @tail = second_last
  end

  def contains?(value)
    current = @head
    until current.next.nil?
      current = current.next
      return true if current.value == value
    end
    return false if current.next.nil?
  end

  def find(value)
    current = @head
    index = 0
    if current.value == value
      index
    else
      until current.next.nil?
        index += 1
        current = current.next
        return index if current.value == value
      end
    end
  end

  def insert_at(value, index)
    current = @head
    i = 0
    node = Node.new(value)
    if index.zero?
      prepend(value)
    else
      until index == i
        i += 1
        temp = current
        current = current.next
      end
      temp.next = node
      node.next = current
    end
  end

  def remove_at(index)
    current = @head
    i = 1
    if index.zero?
      @head = @head.next
    else
      until index == i
        i += 1
        current = current.next
      end
      current.next = current.next.next
    end
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
