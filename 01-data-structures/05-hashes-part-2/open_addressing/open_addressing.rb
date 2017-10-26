require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0.0
  end

  def []=(key, value)

    ind = self.index
    if @items[ind] == nil
      @items[ind] = Node.new(key, value)
      @item_count += 1
    # do nothing if a duplicate already exists at this index
    elsif @items[ind].key == key && @items[ind].value == value
      puts "Already exists"
      return
    else
      nextInd = self.next_open_index(ind)
      if @items[ind].key == key && @items[ind].value != value && nextInd == -1
        self.resize
        @items[nextInd].value = value
        @item_count += 1
      elsif nextInd == -1
        self.resize
        self[key] = value
      else
        @items[nextInd] = Node.new(key, value)
        @items[nextInd].value = value
        @item_count += 1
      end
    end
    
  end

  # look for the value given the key
  def [](key)

    ind = self.index(key, size)
    while ind < size
      if @items[ind].key == key
        return @items[ind].value
      else
        ind += 1
      end
    end
    puts "Not found"

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)

    while @items[index]
      index += 1
    end
    if index >= self.size
      return -1
    else
      return index
    end

  end

  # Simple method to return the number of items in the hash
  def size
    return @items.size
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |i|
      if i != nil
        ind = self.index(i.key, @items.length)
        @items[ind] = Node.new(i.key, i.value)
      end
    end
  end
end
