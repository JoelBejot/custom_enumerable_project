module Enumerable
  # Your code goes here
  def my_map
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end

  def my_each_with_index
    i = 0
    for item in self
      yield item, i
      i += 1
    end
    self
  end

  def my_select
    array = []
    for item in self
      if yield(item) == true
        array << item
      end
    end
    array
  end

  def my_all?
    my_each { |item| return false unless yield item }
    true
  end

  def my_any?
    my_each { |item| return true if yield item }
    false
  end

  def my_none?
    my_each { |item| return false if yield item }
    true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end


[1,2,3].my_map do |item|
  puts item * 2
end