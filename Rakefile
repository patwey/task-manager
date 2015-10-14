require 'rake/testtask'
require 'bundler'
Bundler.require

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file } # don't use './'?
end

# task :do_stuff do
#   Thing.do_something
# end
