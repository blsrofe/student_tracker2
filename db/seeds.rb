# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Klass.destroy_all
KlassStudent.destroy_all
Student.destroy_all

user = User.create(first_name: "Becki", last_name: 'Srofe', email: "bsrofe23@gmail.com", password: "password")

2.times do |klasses|
  title = Faker::Job.unique.field
  school_year = "2017-2018"
  description = Faker::Hipster.sentence(3)
  Klass.create(title: title, school_year: school_year, description: description, user: user)
  puts "Created #{title}"
end

25.times do |students|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  grade_level = "3"
  notes = Faker::TheFreshPrinceOfBelAir.quote
  email = Faker::Internet.unique.free_email
  Student.create(first_name: first_name, last_name: last_name, grade_level: grade_level, notes: notes, email: email)
  puts "Created #{first_name}"
end

students = Student.all

students.each do |student|
  class_1 = Klass.first
  KlassStudent.create(student: student, klass: class_1)
  class_3 = Klass.last
  KlassStudent.create(student: student, klass: class_3)
end
