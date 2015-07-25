#!/bin/sh

## Hack our GEM_HOME to make sure that the `rubygems` support can find our
# unpacked gems in the given GEMFOLDER
export GEM_HOME="/home/tyler/source/github/ruby/nashorn-ruby/build/gems"
export GEM_PATH="/home/tyler/source/github/ruby/nashorn-ruby/build/gems"

exec java -cp /home/tyler/.gradle/caches/modules-2/files-2.1/org.jruby/jruby-complete/1.7.21/e061b9f399a5e8d5cfcca84d4a6baf879111e83c/jruby-complete-1.7.21.jar org.jruby.Main -S $@

