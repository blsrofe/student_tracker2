# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Klass.destroy_all
Student.destroy_all
Observation.destroy_all
Enrollment.destroy_all
Parent.destroy_all
StudentParent.destroy_all

user = User.create(first_name: "Jill", last_name: 'Smith', email: "jill@@gmail.com", password: "password")
user2 = User.create(first_name: "Joe", last_name: 'Thompson', email: "joe@gmail.com", password: "password")
user3 = User.create(first_name: "Sally", last_name: 'Clark', email: "sally@gmail.com", password: "password")
admin = User.create(first_name: "Becki", last_name: 'Srofe', email: "bsrofe23@gmail.com", password: "password", role: "admin")

klass1 = Klass.create(title: "Math 1", school_year: "2017-2018", description: "1st grade math", user: user)
klass2 = Klass.create(title: "Reading A", school_year: "2017-2018", description: "Beginning primary reading", user: user)

klass3 = Klass.create(title: "Math 2", school_year: "2017-2018", description: "2nd grade math", user: user2)
klass4 = Klass.create(title: "Reading B", school_year: "2017-2018", description: "Intermediate primary reading", user: user2)

klass5 = Klass.create(title: "Math 3", school_year: "2017-2018", description: "3rd grade math", user: user3)
klass6 = Klass.create(title: "Reading C", school_year: "2017-2018", description: "Advanced primary reading", user: user3)

puts "Classes created"

5.times do |students|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  grade_level = "1"
  notes = Faker::Lorem.sentences(1)
  email = Faker::Internet.unique.free_email
  student = Student.create(first_name: first_name, last_name: last_name, grade_level: grade_level, notes: notes, email: email)
  Enrollment.create(student: student, klass: klass1)
  Enrollment.create(student: student, klass: klass2)
  puts "Created #{first_name}"
end

5.times do |students|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  grade_level = "1"
  notes = Faker::Lorem.sentences(1)
  email = Faker::Internet.unique.free_email
  student = Student.create(first_name: first_name, last_name: last_name, grade_level: grade_level, notes: notes, email: email)
  Enrollment.create(student: student, klass: klass1)
  Enrollment.create(student: student, klass: klass4)
  puts "Created #{first_name}"
end

5.times do |students|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  grade_level = "2"
  notes = Faker::Lorem.sentences(1)
  email = Faker::Internet.unique.free_email
  student = Student.create(first_name: first_name, last_name: last_name, grade_level: grade_level, notes: notes, email: email)
  Enrollment.create(student: student, klass: klass3)
  Enrollment.create(student: student, klass: klass4)
  puts "Created #{first_name}"
end

5.times do |students|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  grade_level = "2"
  notes = Faker::Lorem.sentences(1)
  email = Faker::Internet.unique.free_email
  student = Student.create(first_name: first_name, last_name: last_name, grade_level: grade_level, notes: notes, email: email)
  Enrollment.create(student: student, klass: klass3)
  Enrollment.create(student: student, klass: klass6)
  puts "Created #{first_name}"
end
student = Student.last

5.times do |students|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  grade_level = "3"
  notes = Faker::Lorem.sentences(1)
  email = Faker::Internet.unique.free_email
  student = Student.create(first_name: first_name, last_name: last_name, grade_level: grade_level, notes: notes, email: email)
  Enrollment.create(student: student, klass: klass5)
  Enrollment.create(student: student, klass: klass6)
  puts "Created #{first_name}"
end

5.times do |students|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  grade_level = "3"
  notes = Faker::Lorem.sentences(1)
  email = Faker::Internet.unique.free_email
  student = Student.create(first_name: first_name, last_name: last_name, grade_level: grade_level, notes: notes, email: email)
  Enrollment.create(student: student, klass: klass5)
  Enrollment.create(student: student, klass: klass4)
  puts "Created #{first_name}"
end

first = Student.first
student_id = first.id + 5
student = Student.find(student_id)

Observation.create(date: Faker::Date.between(60.days.ago, Date.today), subject: "Math", ob_type: "Strength", parent_viewable: true, user: user, student: student, comment: "Great attention shown during lesson today. Use of manipulatives was a great help for her understanding of place value. Challenge with greater numbers.")
Observation.create(date: Faker::Date.between(60.days.ago, Date.today), subject: "Reading", ob_type: "Needs Improvement", parent_viewable: true, user: user2, student: student, comment: "Very distracted during todays lesson. Had trouble focusing both in whole group and small group. Was not able to answer literal comprehension questions from story.")

student2_id = student_id + 10
student_2 = Student.find(student2_id)

Observation.create(date: Faker::Date.between(60.days.ago, Date.today), subject: "Math", ob_type: "Strength", user: user2, student: student_2, comment: "Problem solving skills have increased dramatically since last diagnostic. Last week he was not able to finish in given time and this week correctly solved problem and explained process with ten minutes left. Outside tutoring may be the reason for improvement.")
Observation.create(date: Faker::Date.between(60.days.ago, Date.today), subject: "Reading", ob_type: "Strength", parent_viewable: true, user: user3, student: student_2, comment: "Fluency went up by 10 words per minute this week. He read with a lot of emotion and had great phrasing. Mom said she was practicing reading aloud at home every other day. He enjoys reading to brother at bedtime as well.")

student3_id = student_id + 15
student_3 = Student.find(student3_id)

Observation.create(date: Faker::Date.between(60.days.ago, Date.today), subject: "Math", ob_type: "Needs Improvement", user: user3, student: student_3, comment: "Struggled to understand how many more and how many less. The concept of less than or greater than seems solid though. Try using a number line tomorrow.")
Observation.create(date: Faker::Date.between(60.days.ago, Date.today), subject: "Reading", ob_type: "Needs Improvement", parent_viewable: true, user: user2, student: student_3, comment: "Still struggling to read words with long vowel sounds. He knows the sounds, and can reapeat the rule, but does not use them unless it is pointed out.")

puts "Observations created"

parent1 = Parent.create(first_name: "Julie", last_name: "Henderson", email: "julie@gmail.com", phone_number: "123-343-4343", password: "password")
parent2 = Parent.create(first_name: "Jerry", last_name: "Jacobs", email: "jerry@gmail.com", phone_number: "123-343-4343", password: "password")

StudentParent.create(student: student, parent: parent1)
StudentParent.create(student: student_2, parent: parent1)
StudentParent.create(student: student_3, parent: parent2)
