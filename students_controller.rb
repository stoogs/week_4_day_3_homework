require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
  get '/student_list' do
    @students = Student.all()
    # @house = House.all()
    erb( :index )
  end
# show
  # get '/student'
# new
  get '/students/new' do
    @house = House.all
    erb(:new)
  end
# create
  post '/students_list' do
    @new_student = Student.new(params)
    @new_student.save()
    erb( :create )
  end
# edit

# update

# destroy
