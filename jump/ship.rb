#require_relative 'mothership'
class Ship

  def jump
    #raise "Not implemented yet."
    if block_given?
      @coordinates = yield.compute
      puts "Jumping to <<#{@coordinates}>>!"
    else
      puts "Mothership is not defined!"
    end
  end

end

# whitestar = Ship.new
# cloud9    = Mothership.new
# whitestar.jump {cloud9}
