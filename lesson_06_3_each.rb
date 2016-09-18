# Напишите метод my_each, расширяющий класс Array, который работает точь-в-точь как и метод each:
class Array
  def my_each
    for i in self
      yield(i)
    end

  end
end
numbers = [1, 2, 3, 4, 5]
#
numbers.each { |element| puts element }
# # => 1
# # => 2
# # => 3
# # => 4
# # => 5
#
numbers.my_each { |element| puts element }
# Результат вывода будет такой же как в предыдущем случае
