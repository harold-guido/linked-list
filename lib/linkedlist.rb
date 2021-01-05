class LinkedList
  attr_accessor :head, :tail, :nodes

  def initialize(value = nil)
    @head = Node.new(value)
    @tail = @head
    @nodes = []
  end

  def append(value)
    if @tail == @head then
      @tail = Node.new(value)
      @head.next_node = @tail
    else
      temp_tail = @tail
      @tail = Node.new(value)
      @nodes.push(Node.new(temp_tail.value, @tail))

      if @nodes.length > 1 then
        @head.next_node = @nodes[0]
        @nodes[-2].next_node = @nodes[-1]
      end
    end
  end

  def prepend(value)
    if @head == @tail then
      @head = Node.new(value, @tail)
    else
      temp_head = @head
      temp_nodes = @nodes
      
      @nodes = [@head] + temp_nodes
      @head = Node.new(value, @nodes[0])

      (@nodes.length-1).times do |i|
        @nodes[i].next_node = @nodes[i+1]
      end
    end
  end

  def size()
    @head = @tail ? 1 : 2 + @nodes.length
  end

  def head()
    return @head
  end

  def tail()
    return @tail
  end

  def to_s(node = @head)
    if node == @tail then
      return "[ #{node.value} ] -> [ nil ]" 
    else
      return "[ #{node.value} ] -> #{to_s(node.next_node)}"
    end
  end
end
