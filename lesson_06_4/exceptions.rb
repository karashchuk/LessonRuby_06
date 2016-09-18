# Exception
#  NoMemoryError
#  ScriptError
#    LoadError
#    NotImplementedError
#    SyntaxError
#  SignalException
#    Interrupt

#  StandardError
#    ArgumentError
#    IOError
#      EOFError
#    IndexError
#    LocalJumpError
#    NameError
#      NoMethodError
#    RangeError
#      FloatDomainError
#    RegexpError
#    RuntimeError
#    SecurityError
#    SystemCallError
#    SystemStackError
#    ThreadError
#    TypeError
#    ZeroDivisionError
#  SystemExit
#  fatal

# catch :wonder do
#   1 + 1
#   throw :wonder
#   puts "Catch it, catch it"
# end
# puts "That's all!"


def test
  catch :move do
    [[1,2,3], [4,5,6], [7,8,9]].each do |group|
      group.each do |element|
        throw :move if true
      end
    end
  end

  # We want to go here

end


# catch(:here) do
#   catch(:here_2) do
#     throw(:another_one)
#   end
#   p 'inside catch'
# end
#
# catch(:another_one) do
#   p 'After'
# end



# def sample
#   1 / 0
# rescue

#   # require 'sdfdf'
#   1 / 1
# rescue NameError, ZeroDivisionError => error
#   # logger.info error.message, error.backtrace
  # puts "Была ошибка имени файла или деления на ноль"
# rescue LoadError => error
#   p error.class
# ensure
#   p 'WILL PRINT IT ANYWAY'
#   # Close connection
#   # Close file
# end

# sample


# begin
  # hey!   # => NoMethodError
  # 1 / 0 # => ZeroDivisionError
#   # require 'one' # => LoadError
# rescue ZeroDivisionError, NoMethodError => error
# rescue ZeroDivisionError
#   puts "[Деление на ноль] Error, error!"
  # p error.backtrace
# rescue NoMethodError
#   puts "[Нет такого идентификатора] Error, error!"
# # rescue Exception
# #   p "[Загрузка отсутствующей библиотеки] Error, error!"
# rescue ZeroDivisionError => error
  # puts error.backtrace
# end
# puts "done"
#
# def warp!
#   1 / 0
# rescue ZeroDivisionError, NoMethodError => error
#   puts error.backtrace
# # #   error
# rescue NameError => err
#   # err
#   p "There was an error!", error.backtrace
# ensure
#   p 'Close databse connection'
# end
#
# warp!
# puts "It's okay"

# result = 1 / 1 rescue "There was an error!"
# result = 1 / 0 rescue nil
# p result

class Ship

  MINIMAL_FUEL_LEVEL = 200

  class NotEnoughFuelError < StandardError
  end

  def initialize fuel:
    @fuel    = fuel
    @databse = Struct.new(:db_name) do
      def close
        p 'Database was closed'
      end
    end.new
  end

  def warp_jump
    warp!
  # rescue NotEnoughFuelError => error
  #   puts "Не могу искривить пространство, нужно больше топлива!"
  #   puts error.message
  # ensure
  #   @databse.close
  #   # Ensure code
  #   p "send email to presedent"
  end

  def warp!
    raise NotEnoughFuelError, "Парни, заправьте корабль топливом!" if @fuel < MINIMAL_FUEL_LEVEL
    puts "Curving space!"
  end

end


# Ship.new(fuel: 100).warp_jump


# begin
#   Ship.new(fuel: 500).warp_jump
# rescue Ship::NotEnoughFuelError => e
#   puts e.class
#   puts e.message
#   puts e.backtrace
# end

# result = 1 / 1 rescue nil
#
#
# if result
# else
# end
