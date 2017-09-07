class MyStack
  attr_accessor :top

  def initialize

    @stack = Array.new
    self.top = nil

  end

  def push(item)

    @stack.push(item)
    self.top = item

  end

  def display_stack

    puts @stack

  end

  def pop

    top_item = self.top
    @stack.delete(top)
    self.top = @stack.last
    return top_item

  end

  def empty?

    @stack.empty? ? true : false

  end

end

stack1 = MyStack.new()
stack1.push(2)
stack1.push(4)
stack1.push(10)
stack1.push(-5)

puts stack1.empty?
stack1.pop
stack1.display_stack