require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')
#home
get '/' do
  erb( :welcome )
end
# index
  get '/student_list' do
    @students = Student.all()
    erb( :index )
  end
# show
  get '/student_list/:id' do
    @student = Student.find(params['id'])
    erb ( :show )
  end
# new
  get '/student/new' do
    @house = House.all
    erb( :new )
  end
# create
  post '/student_list' do
    @new_student = Student.new(params)
    @new_student.save()
    erb( :create )
  end
# edit
get '/student_list/:id/edit' do
  @student = Student.find(params['id'])
  @house = House.all
  erb( :edit )
end

# update
post '/student_list/:id' do
  student = Student.new( params )
  student.update
  redirect to "student_list/" + params['id']
end

# destroy
