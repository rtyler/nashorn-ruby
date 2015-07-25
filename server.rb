#!/usr/bin/env ruby

require 'java'
java_import 'com.oracle.avatar.js.Server'

server = Server.new
puts server.inspect
server.run('helloserv.js')
