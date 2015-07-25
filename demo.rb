#!/usr/bin/env ruby

require 'java'
java_import 'javax.script.ScriptEngineManager'

# This JS class is a simple proxy class to help dispatch JavaScript function
# calls from JRuby into an instantiated Nashorn JS engine
class JS
  # Instantiate the engine, when passed a file_path, set up the engine and
  # evaluate the file_path
  def initialize(file_path=nil)
    @engine = ScriptEngineManager.new.get_engine_by_name('nashorn')

    if file_path
      self.eval_file(file_path)
    end
  end

  # Evaluate the JavaScript at the given file_path via the JS engine
  def eval_file(file_path)
    @engine.eval(File.open(file_path, 'r').read)
  end

  # Defining method_missing so we can dispatch methods into our Nashorn engine
  # if we receive a functional call destined for JS
  def method_missing(method, *args)
    return @engine.invoke_function(method.to_s, *args)
  end
end

puts '-' * 30
js = JS.new 'demo.js'
result = js.addThing(1, 2)
puts "Doing with math in JavaScript gives us: #{result}"
puts '-' * 30
