require 'bundler'
Bundler.require # requires all gems in Gemfile

# get the path of the root of the app (this is something that should not change)
APP_ROOT = File.expand_path("..", __dir__)

# require the controller(s):
#   Dir.glob makes all of these things into an array
#   then require all of 'em
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }

# require the model(s)
#   samsies
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }

# configure TaskManagerApp settings
class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end
