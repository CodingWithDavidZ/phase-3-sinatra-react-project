puts '🌱 Seeding spices...'

30.times do
  Employee.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    hire_date: Faker::Date.between(from: '1986-08-23', to: '2022-09-20'),
    employee_num: Faker::Number.number(digits: 8),
    manager_id: rand(1..4),
  )
end

4.times do
  Manager.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    hire_date: Faker::Date.between(from: '1986-08-23', to: '2021-09-20'),
    employee_num: Faker::Number.number(digits: 8),
  )
end

puts '✅ Done seeding!'
