# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."

AttendanceRecord.destroy_all
User.destroy_all
Employee.destroy_all
Position.destroy_all
Department.destroy_all
Organization.destroy_all

puts "Seeding started..."

org = Organization.create!(
  name: "Vardara Software Pvt Ltd",
  slug: "vardara software",
  settings: "default"
)

hr = Department.create!(
  name: "HR",
  description: "Human Resource Department",
  organization: org
)

it = Department.create!(
  name: "IT",
  description: "Technology Department",
  organization: org
)

hr_manager = Position.create!(
  title: "HR Manager",
  base_salary: 60000,
  department: hr,
  employee_type: 0
)

developer = Position.create!(
  title: "Software Developer",
  base_salary: 80000,
  department: it,
  employee_type: 1
)

emp1 = Employee.create!(
  first_name: "Alice",
  last_name: "Sharma",
  email: "alice@gmail.com",
  phone: "9999999999",
  salary: 65000,
  date_of_joining: Date.today - 30,
  department: hr,
  position: hr_manager
)

emp2 = Employee.create!(
  first_name: "Bob",
  last_name: "Verma",
  email: "bob@gmail.com",
  phone: "8888888888",
  salary: 85000,
  date_of_joining: Date.today - 10,
  department: it,
  position: developer
)

User.create!(
  name: "Alice User",
  employee: emp1
)

User.create!(
  name: "Bob User",
  employee: emp2
)

AttendanceRecord.create!(
  employee: emp1,
  date: Date.today,
  clock_in_at: Time.current.beginning_of_day + 9.hours,
  clock_out_at: Time.current.beginning_of_day + 17.hours,
  notes: "On time"
)

AttendanceRecord.create!(
  employee: emp2,
  date: Date.today,
  clock_in_at: Time.current.beginning_of_day + 10.hours,
  clock_out_at: Time.current.beginning_of_day + 18.hours,
  notes: "Late arrival"
)

puts "Seeding completed successfully!"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?