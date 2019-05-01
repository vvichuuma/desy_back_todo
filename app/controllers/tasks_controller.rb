class TasksController < ApplicationController

 
  def index 
     
     @tasks = Task.all 
     render "index.json.jbuilder"

  end 


  def create 
    
    @task = Task.new(
        
       description: params[:description],
       user_id: current_user.id
 
      )

    if @task.save
       render "task.json.jbuilder"
    else 
       render json:{mess: "Task is not created"}
    end 
 
  end 


  def view_tasks

   
    @tasks = Task.where(user_id: current_user.id)

    render "elon_task.json.jbuilder"

    
  end 


  def delete 

    @task = Task.find_by(id: params[:id]);
    
   if @task.destroy
     render json:{mess: "THe task has been removed"}
   end 

  end 


end
