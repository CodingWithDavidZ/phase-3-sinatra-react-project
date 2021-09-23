class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  get '/employees' do
    employees = Employees.all.order(:hire_date)
    employees.to_json
  end

  get '/managers' do
    managers = Managers.all.order(:hire_date)
    managers.to_json
  end

  get '/employees/:employee_num' do
    employee = Employees.find_by('employee_num = ?', params[:employee_num])
    employee.to_json
  end

  post '/employees' do
    employee =
      Employees.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        hire_date: params[:hire_date],
        employee_num: params[:employee_num],
        managers_id: params[:manager_id],
      )
  end

  delete '/employees/:id' do
    employee = Employees.find(params[:id])
    employee.destroy
    employee.to_json
  end

  delete '/employees/:employee_num' do
    employee = Employees.find_by('employee_num = ?', params[:employee_num])
    employee.destroy
    employee.to_json
  end
end
