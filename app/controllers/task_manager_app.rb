require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard # dashboard view
  end

  get '/tasks' do
    @tasks = TaskManager.all
    erb :index # index view
  end

  get '/tasks/new' do
    erb :new # new task view
  end

  post '/tasks' do # submitted by the form in the new view
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id| # grabs whatever is after tasks/ and stores it in id
    @task = TaskManager.find(id.to_i)
    erb :show
  end
end
