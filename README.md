# Ruby method_missing and respond_to_missing? Gotcha

This example showcases a scenario where Ruby's dynamic method handling (`method_missing`) and response checking (`respond_to_missing?`) can lead to unexpected behavior.  Always ensure that `respond_to_missing?` accurately reflects the actual methods available, or you could mask the existence of actual errors in your code.

The `bug.rb` file contains code that uses `method_missing` to handle calls to non-existent methods, and `respond_to_missing?` always returns true.  While seemingly harmless, this hides any underlying errors if a method was intended but not properly defined.