```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    # Handle method calls dynamically
    puts "Method '#{method_name}' called with args: #{args.inspect}"
  end
  def respond_to_missing?(method_name, include_private = false)
    true
  end
end

my_object = MyClass.new(10)
my_object.non_existent_method(1,2,3) #This will be handled by method_missing
my_object.respond_to?(:non_existent_method) #This will return true because of respond_to_missing?
```