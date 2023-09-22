# frozen_string_literal: true

require_relative 'enumerable_module'

class MyList
  include MyEnumerable

  def initialize(*list)
    @list = list
  end

  def each
    (0...@list.length).each do |i|
      yield(@list[i])
    end
  end
end

list = MyList.new(1, 2, 3, 4)

puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })
puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 5 })
filtered_list = list.filter(&:even?)
puts filtered_list.inspect
list.each { |e| print "#{e} " }
