if false
  greeting = “hello world”
end

p greeting
=begin
Logically, I think it wouold throw an error 
as my mental model of the code is that the variable is not assigned unless the condition is true.
But I have a feeling it will return nil.
=end

# Sure enough, it returned nil.