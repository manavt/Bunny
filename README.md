# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# rails new ecom
# cd ecom
# ls
# rails g controller users index new edit show
 controller class inside app/controller folder for users and users views inside app/views/users

template_names -
  - index
  - new
  - edit
  - show




method            Action                Template           Job description

get               index                   yes              To display all the data from user table

get               new                     yes              To create a new user (holds a form)

post              create                   no              value from new action comes to create action and it save those data in user table

get               edit                    yes              To update a existing user (holds a form)


put/patch         update                   no             value from edit action comes to update action and it modify those data in user table


get               show                    yes              To display single user from user table   

delete            destroy                  no              To display an existing user from user table




validation
db related query  







session  # to store the user information  at server side
session => {}
session[:user_id] = value   

cookies  # to store the user information at the client



Filter - runs before, after and around to an action


 - before_action
 - after_action
 - around_action

 class A
    after_action :method_name
    def a1
    end
    def a2
    end
    def method_name
       "logic"
    end
 end







 Association -
 to join one or more table , we use Association


 belongs_to
 has_one
 has_many
 has_one :through
 has_many :through
 has_and_belongs_to_many
 polymorphic
 STI   



 class User
  has_one :image
 end

 class Product
   has_many :images
 end

 class Image
   belongs_to :user
   belongs_to :product
 end   



 To create the image from console
 m = Image.create(photo: File.new('/Users/1228369/Documents/Ruby-Content/user.png', 'r'))
 m.save(validate: false)
  Once you have the image decide to assign to any of these functionality  
  m.update_columns(user_id: User.first.id)

  
