get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :create
end

post '/events/create' do
  @event = Event.new(params[:event])
  if @event.valid?
    @event.save
    redirect to('/')
  else
    erb :create
  end
end
