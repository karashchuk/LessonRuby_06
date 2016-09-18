# Для класса Hash:
# •	Метод, превращающий хэш в объект класса ActiveSupport::HashWithIndifferentAccess. Такой объект ничем не отличается от хэша, однако если ключом пары является строка, вы можете использовать символ (объект класса Symbol) и наоборот:
require 'active_support/all'
#include ActiveSupport
fruits={apple: 7, orange: 8}.with_indifferent_access
p fruits[:apple]  # => 7
p fruits['apple'] # => 7

# •	Метод, возвращающий хэш без пар, ключи которых были переданы в качестве аргументов метода
hash = { a: true, b: false, c: nil }
p hash.except(:c)     # => { a: true, b: false }
p hash.except(:a, :b) # => { c: nil }

# •	Метод, превращающий хэш в строку запроса (query string)
hash1 = {name: 'David', nationality: 'Danish'}
p hash1.to_query
# •	Метод, превращающий все ключи хэша в объекты класса String
puts hash.stringify_keys

# Для класса Array:
# •	Метод, возвращающий пустой хэш, если последний элемент массива не является хэшем и последний элемент массива в обратном случае

arr = [1,2,3,{one: 2}]
h = arr.extract_options!()
p arr,h
arr.push(4)
h = arr.extract_options!()
p arr,h
# •	Метод, принимающий один аргумент и если этот аргумент является массивом, то он возвращается без изменений. В ином случае возвращается массив единственным элементом которого будет переданный аргумент
p Array.wrap([1,2])
p Array.wrap(1)

# •	Метод, возвращающий последние несколько элементов массива, начиная с индекса переданного в качестве аргумента
array = [1,2,3,4,5]
p array.from(2)
