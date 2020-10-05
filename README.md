# Postcards from a Stranger

This is a Ruby on Rails application that was built in 3 hours during an interview. While the actual build was completed in 3 hours, there was a lot of preparation that went into building a Walkthrough, which is included below.

The idea behind the application was to allow people to send and recieve postcards to and from strangers. The motivation was thinking about freshers when they first go to uni and to help them feel connected and counter the affects of homesickness. 

A live version of the app can be viewed here: https://postcards-purpleriver.herokuapp.com/

![Screenshot](https://github.com/phil-6/postcards/blob/master/screenshot.png?raw=true)


## Requirements

Ruby 2.6.5

Rails 5.2.4.3

Other dependencies are in the Gemfile.

Set up is as any other Rails project.
For dependencies
```bash
$ bundle update
$ bundle install 
```

For database
```bash
$ rails db:create
$ rails db:setup
```

Launch App
```bash
$ rails s
```
## Walkthrough

This walkthrough was followed to spin up the application in 3 hours. 

`$ rbenv shell 2.6.5`

`$ rails _5.2.4.1_ new postcards -T -d=postgresql `

- update project structure to use ruby sdk

- update .gitignore 
	- exclude intellij stuff

- update Gemfile 

```ruby
# Use SCSS for stylesheets
gem 'sassc-rails'
```

- add devise

```ruby
# User Authentication and management
gem 'devise'
```

- add rspec, faker and factory_bot in dev and test

```ruby
# Testing
gem 'rspec-rails'
# Faker for seeds
gem 'faker'
# Factory Bot for testing
gem 'factory_bot_rails'
```

- add localhost mailer to development config
	 - config/environments/development.rb:

	`config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`

- initial setup
	- app/views/layouts/application.html.erb
		-  update erb synatax errors

```html
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```


***Initial Commit Now***

- install devise as an authentication solution

`$ bundle update --bundler`

`$ bundle install`

`$ bundle update`

`$ rails g rspec:install`

***Commit Now***

`$ rails g controller pages main about user_profile`

***Commit Now***

`$ rails g devise:install`

`$ rails g devise User`


***Commit Now***

- models/user.rb:
	:confirmable, :trackable
- rename migration
- db/migrate/000-devise_create_users.rb:
	- Uncomment trackable
	- Uncomment confirmable
	- Uncomment confirmation_token index
	- Add customisation
- app/controllers/application_controller.rb:

```ruby
# before any action happens, it will authenticate the user
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
protected
def configure_permitted_parameters
	added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	devise_parameter_sanitizer.permit :account_update, keys: added_attrs
end
```

- app/controllers/pages_controller.rb

```ruby
skip_before_action :authenticate_user!, only: [:main, :about]
before_action :set_user, only: :user_profile
```

***Commit Now***

`$ rails g controller Postcards`

`$ rails g model Postcard`

- rename migration
- db/migrate/001-create-postcards.rb:
	- Add customisation
- optional
	- Add db seeds

***Commit Now***

`$ rails db:migrate`

`$ rails db:setup`

***Commit Now***

`$ rails g devise:views`


***Commit Now***
- config/routes.rb:
	- root 'pages#main'

- Get the basic HTML and CSS in
	- views/layouts/application.html.erb
	- views/layouts/\_alerts.html.erb
	- views/layouts/\_nav.html.erb
	- views/devise/registrations/new.html.erb
	- views/devise/registrations/edit.html.erb
	- views/devise/sessions/new.html.erb
	- views/devise/shared/\_links.html.erb
	- assets/stylesheets/
		- application.css > application.scss
		- pages.css > global.scss
		- postcards.css > postcards.scss
		- forms.scss
		- variables.scss
		- alerts.scss
		- boostrap-colors.scss
		- navbar.scss
		- mainpage.scss
		- header.scss
		- *(cheat code)* `cp -r ../../2-rails-w-devise/postcards/app/assets/stylesheets/* app/assets/stylesheets` 
	- pages_controller.rb
	- user-profile.html.erb
	- main.html.erb
	- Update About Page
		- Update route to about from navbar
		- Update about page html


***Commit Now***
`$ rails s`
- Fix Sign Up Error
	- Update users migration
		- change `user_name` to `username`
			- NOTE: might not have to do this on the day ;)
	- Update app/models/user.rb
	- Update config/initalisers/devise.rb
		- config.authentication_keys from `email` to `login`

***Commit Now***
- Create basic postcard logic
	- Update postcards controller
	- Update postcard model
	- Update Routes
	- Create Postcard Form
- Create user_profile
	- update pages controller
	- update user_profile.html.erb

***Commit Now***

- Configure tests
    - create spec/support/factory_bot.rb and add:
```ruby
# Use FactoryBot
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
```
    - spec/rails_helper.rb uncomment:
```ruby
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```
    - spec/rails_helper.rb add:
```ruby
require 'spec_helper'
require 'rspec/rails'
# note: require 'devise' after require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  # For Devise > 4.1.1
  config.include Devise::Test::ControllerHelpers, :type => :controller

end
```

- Create Factories - spec/factories/factories.rb


