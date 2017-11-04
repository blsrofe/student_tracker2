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
Observation.destroy_all

user = User.create(first_name: "Becki", last_name: 'Srofe', email: "bsrofe23@gmail.com", password: "password")
user2 = User.create(first_name: "Joe", last_name: 'Smith', email: "joe@gmail.com", password: "password")

2.times do |klasses|
  title = Faker::Job.unique.field
  school_year = "2017-2018"
  description = Faker::Hipster.sentence(3)
  Klass.create(title: title, school_year: school_year, description: description, user: user)
  puts "Created #{title}"
end

2.times do |klasses|
  title = Faker::Job.unique.field
  school_year = "2017-2018"
  description = Faker::Hipster.sentence(3)
  Klass.create(title: title, school_year: school_year, description: description, user: user2)
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
  id = Klass.first.id
  class_1 = Klass.find(id)
  KlassStudent.create(student: student, klass: class_1)
  class_2 = Klass.find(id + 1)
  KlassStudent.create(student: student, klass: class_2)
  class_3 = Klass.find(id + 2)
  KlassStudent.create(student: student, klass: class_3)
  class_4 = Klass.find(id + 3)
  KlassStudent.create(student: student, klass: class_4)
  5.times do |observation|
    comment = Faker::ChuckNorris.fact
    date = Faker::Date.between(60.days.ago, Date.today)
    subject = Faker::Job.field
    observation = Observation.create!(comment: comment, date: date, subject: subject, ob_type: "Strength", user: user, student: student)
    puts "Create observation for #{student.first_name}"
  end
  5.times do |observation|
    comment = Faker::ChuckNorris.fact
    date = Faker::Date.between(60.days.ago, Date.today)
    subject = Faker::Job.field
    observation = Observation.create!(comment: comment, date: date, subject: subject, ob_type: "Strength", user: user2, student: student)
    puts "Create observation for #{student.first_name}"
  end
end
