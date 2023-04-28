class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
    @projects = @employee.projects.build
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employee_path(@employee)
    else
      render action: :new
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @projects = @employee.projects
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :email, :phone, projects_attributes: [:id, :name, :description, :project_type, :_destroy, :developer, tech: [],project_manager: []])
  end
  
end
