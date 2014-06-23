require "caller.jar"
#java_import "MyCallback"

require "jruby/core_ext"

class MyCallbackLocal
  def hello
    puts "[MyCallbackLocal] hello from MyCallbackLocal"
  end
end
MyCallbackLocal.become_java!

puts "[caller_test] trying with class inside jar"
Java::Default::Caller.callbackTest("A")

puts "[caller_test] trying with another class inside jar"
Java::Default::Caller.callbackTest("C")

puts "[caller_test] trying with JRuby class that is compiled to .class with jrubyc"
Java::Default::Caller.callbackTest("MyCallbackJrubyc")

puts "[caller_test] trying with JRuby class that is compiled to .java with jrubyc and .class with javac"
Java::Default::Caller.callbackTest("MyCallbackJrubycJavac")

puts "[caller_test] trying with JRuby class defined locally"
Java::Default::Caller.callbackTest("MyCallbackLocal")
