class TypesOfData
  def initialize(number, float, boolean, string, symbol, array, hash, range, nil_value)
    @number = number
    @float = float
    @boolean = boolean
    @string = string
    @symbol = symbol
    @array = array
    @hash = hash
    @range = range
    @nil_value = nil_value
  end

  def display
    puts "Integer: #{@number}"
    puts "Float: #{@float}"
    puts "Boolean: #{@boolean}"
    puts "String: #{@string}"
    puts "Symbol: #{@symbol}"
    puts "Array: #{@array}"
    puts "Hash: #{@hash}"
    puts "Range: #{@range}"
    puts "Nil: #{@nil_value}"
  end
end

p1 = TypesOfData.new(
  10,
  3.14,
  true,
  "Hello",
  :ruby,
  [1, 2, 3],
  { name: "Divakar", age: 22 },
  (1..5),
  nil
)

p1.display
