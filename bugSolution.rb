```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    # Handle method calls dynamically, but only if the method isn't defined
    if !self.respond_to?(method_name)
      puts "Method '#{method_name}' called with args: #{args.inspect}"
    else
      super #Pass the method call to the parent if a method with same name exists
    end
  end
  def respond_to?(method_name, include_private = false)
    method_name == :value || super
  end
end

my_object = MyClass.new(10)
my_object.non_existent_method(1,2,3) #This will be handled by method_missing
my_object.respond_to?(:non_existent_method) #This will return false now
my_object.value #This will work correctly because the respond_to? handles it
```