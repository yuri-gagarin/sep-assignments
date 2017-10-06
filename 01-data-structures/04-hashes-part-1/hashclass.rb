require_relative "hash_item"

class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

# add a new object
  def []=(key, value)
    #check if the index is available, if available add new HashItem
    if @items[index(key, @items.length)] == nil
      @items[index(key, @items.length)] = HashItem.new(key, value)
    elsif @items[index(key, @items.length)].key != key
      self.resize
      self[key] = value
    elsif @items[index(key, @items.length)].key == key && @items[index(key, value)].value != value
      self.resize
      @items[index(key, @items.length).value] = value
    end
  end

#return the value given the key
  def [](key)
     if @items[index(key, @items.length)] != nil && @items[index(key, @items.length)].key == key
       puts @items.length
      return @items[index(key, @items.length)].value
    else
      puts "This value does not exist in the hash"
    end
  end

  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |i|
      unless i == nil
        if @items[index(i.key, @items.length)] == nil
          self[i.key] = i.value
        elsif @items[index(i.key, @items.length)].key != key
          self.resize
          self[i.key] = i.value
        elsif @items[index(i.key, @items.length)].key === key && @items[index(i.key, @items.length)].value != value
          self.resize
          @items[index(i.key, @items.length)].value = i.value
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end
