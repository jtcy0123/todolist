# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
require_relative 'app/models/task.rb'
require_relative 'app/models/list.rb'
require_relative 'app/models/app.rb'

# Your Code begins from this line onwards #

input = ARGV
input[0] = input[0].gsub(/[^a-zA-Z]/,"")

App.new(input).run
