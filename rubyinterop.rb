#!/usr/bin/env ruby

require 'java'
java_import 'javax.script.ScriptEngineManager'
java_import 'javax.script.ScriptContext'

class Example
  def hello
    return 'hello world from Ruby'
  end
end

engine = ScriptEngineManager.new.get_engine_by_name('nashorn')
engine.get_bindings(ScriptContext::ENGINE_SCOPE).put('example', Example.new)


puts '-' * 30
engine.eval(File.open('rubyinterop.js').read)
puts '-' * 30
