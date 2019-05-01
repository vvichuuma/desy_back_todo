class UsersController < ApplicationController
  

  def index 
    
  @users = User.all 

  render "user.json.jbuilder"

  end 

   
 def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end





  def update
    
     @user = User.find_by(name: params[:name])

     @user.name = params[:namee] || @user.name

    if @user.save

    render "user.json.jbuilder"

    else 
      render json:{mess: "Didn't save"}
    end 
 
  end 


  def del
    @user = User.find_by(id:params[:id])

    if @user.destroy
      render json:{mess: "The User has been removed!"}
    end 
 
  end 


  def user_tasks
    
    @user = User.find_by(name: params[:name])

    render "user_task.json.jbuilder"

  end 

  def currentuser
   @user = User.find_by(id: current_user.id);

   render "currentuser.json.jbuilder"
  end 


  def current_user_task
    
    @user = User.find_by(id:current_user.id).tasks

    render "current_user.json.jbuilder"
  
  end 


  def beatles
    render json:{mess: "Music is Life"}
  end 

  def programmer
    render json:{mess: "This is a programmer"}
  end 


end
