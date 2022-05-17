# Full linked list
class LinkedList
  attr_accessor :head, :tail

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
    end
  end

  def prepend(value)
    this_node = Node.new(value)
    this_node.next = @head unless @head.nil?
    @head = this_node
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
5.times do
  list.prepend(rand(10))
end
