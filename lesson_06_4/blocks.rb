# result = begin
#   # Здесь идут вычисления
#   42
# end



# def sample value = nil
#   puts "Hello, now is:"
#   # p time
#   p yield if block_given?
# end
#
# time = Time.now
#
# sample { time }


# sample do |element|
#   element + 100
# end


# block = Proc.new do
#   puts 1 + 1 + 1
# end


# def sample block
#   # yield if block_given?
# #   puts "Hello, now is:"
  # block.call
# end

# sample { puts 1 + 1 + 1 }
# sample block




# p results

# def operation text, a = -1, b = 1
#   puts "Before block we have a = #{a} and b = #{b}"
#   result = yield(a, b) if block_given?
#   puts "#{text} #{result}"
#   puts
# end
#
# operation("The result of add is:", 100, -90) { |a, b| a + b }
# operation("The result of sub is:")           { |a, b| a - b }
# operation("The result of mult is:")          { |a, b| a * b }
# operation("The result of division is:")      { |a, b| a / b }


# operation("The result of division is:") {  }

# add = Proc.new do |a, b|
#   a + b
# end


# def operation text, &block
#   # result = block.call(1, -1) unless block.nil?
#   result = block.call unless block.nil?
#   puts "#{text} #{result}"
# end
#
#
# operation("The result of mult is:")
# operation("The result of mult is:") { |a = 6, b = 2| a * b }



# def operation number, &blk
#   blk.call "Hello, block from operation" unless blk.nil?
#   delegate_operation blk
#   puts "The number of operation is: #{number}"
# end
#
#
# def delegate_operation operation
#   operation.call "Hello delegated block"
# end
#
# operation(1) do |text = nil|
#   p text
# end

# def tests &block
#   puts "Sum of 1 and 1: #{block.call(1, 1, :+)}"
#   puts "Multiple of 1 and 1: #{block.call(1, 1, :*)}"
#   puts "Subtract of 1 and 1: #{block.call(1, 1, :-)}"
# end

# def tests
#    puts "Sum of 1 and 1: #{yield(1, 1, :+)}"
#    puts "Multiple of 1 and 1: #{yield(1, 1, :*)}"
#    puts "Subtract of 1 and 1: #{yield(1, 1, :-)}"
# end

# tests do |op1, op2, operator|
#   op1.send operator, op2
# end

# operation { 100 * 75.3 }
# operation { 1 - 1 }


# [1,2,3,4,5].each do |element|
#   element
# end

# def super_print str
#   p str
#   p yield if block_given?
# end

# super_print("I am just a block")



# def operation text, &block
#   block # => Proc
#   result = block.call(1, -1) unless block.nil?
#   puts "#{text} #{result}"
# end

# numbers = (1..10).to_a

# numbers.map! begin puts 'hi' end

# map_iteration_result = Proc.new do |element|
#   element ** 2
# end
#
# p numbers.map! &map_iteration_result

# p numbers






# self => main (main.class => Object)
name = 'Andromeda'

block = Proc.new do |object_context|
  # self => main (main.class => Object)
  # puts "Ship name is: #{name}"
  p self
  # p object_context
end

# block = labmda do |object_context|
#   p self
# end
#
# block = -> object_context do
#   p self
# end


class Ship

  def print_name block
    p self # => Ship.new
    # yield

    block.call(self)
    # block.call
    yield
  end

  # def create_block
  #   Proc.new do
  #     self
  #   end
  # end

end

# p self
# Ship.new.print_name block

# Ship.new.print_name block

# p Ship.new.create_block.call
Ship.new.print_name(block) { puts "Another block #{self}" }
