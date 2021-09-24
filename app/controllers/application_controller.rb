class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  get '/employees' do
    employees = Employee.all.order(:created_at)
    employees.to_json(include: :manager)
  end

  get '/managers' do
    managers = Manager.all.order(:hire_date)
    managers.to_json(include: :employees)
  end

  get '/employeeNumber/:employee_num' do
    employee = Employee.find_by('employee_num = ?', params[:employee_num])
    employee.to_json
  end

  post '/employees' do
    employee =
      Employee.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        hire_date: params[:hire_date],
        employee_num: params[:employee_num],
        manager_id: params[:manager_id],
      )
  end

  delete '/employees/:id' do
    employee = Employee.find(params[:id])
    employee.destroy
    employee.to_json
  end

  delete '/employeeNumber/:employee_num' do
    employee = Employee.find_by('employee_num = ?', params[:employee_num])
    employee.destroy
    employee.to_json
  end
end
