class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize

    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last

  end

  def enqueue(element)
    @queue.push(element)
    @head = @queue[0]
    @tail = @queue.last

  end

  def dequeue

    dequeued_el = @queue.shift
    @head = @queue[0]
    @tail = @queue.last
    return dequeued_el

  end

  def empty?

    @queue.empty? ? true : false
    
  end
end