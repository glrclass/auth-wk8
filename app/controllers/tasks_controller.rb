class TasksController < ApplicationController
  def index
    if session["user_id"] != nil
    @tasks = Task.where({"user_id" => session["user_id"]}) #used to be Task.all. This new thing makes it only those that are relevant to a user ID
    else
      flash["notice"] = "Login first!"
      redirect_to "/login"
    end
  end

  def create
    @task = Task.new
    @task["description"] = params["description"]
    @task["user_id"] = session["user_id"] #assign task to the user
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
