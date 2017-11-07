# Student Tracker

This app allows teachers a space to keep and organize student observations. Teachers can also view observations for their students that were written by other teachers improving communication, and saving teachers time. Admins can create new teacher accounts as well as classes and students and assign students to classes. Additionally, observations are analyzed by the Watson Tone Analyzer and after viewing the results, teachers can choose to make observations visible to parents or not. Parents have a separate login to see their child's observations. This project is a Turing School Capstone Module 3 backend project to demonstrate mastery of the following:


### Getting Started
```
git clone git@github.com:blsrofe/student_tracker2.git
cd student_tracker2
bundle install
rake db: {create,migrate,seed}
```

## Deployment

visit https://student-tracker2.herokuapp.com/

## Built With

* [Rails 5.1.4](http://api.rubyonrails.org) - The web application framework used
* [Bootstrap](https://getbootstrap.com/docs/4.0/getting-started/introduction/) - CSS framework used
* [Postgresql](https://www.postgresql.org/) - Relational database
