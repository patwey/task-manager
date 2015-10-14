class TaskManagerApp < Sinatra::Base
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

  get '/tasks/:id/edit' do |id| # can also do params[:id]
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect '/tasks'
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  not_found do # in case there's an error
    erb :error
  end
end
