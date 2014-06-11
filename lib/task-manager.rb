
# Create our module. This is so other files can start using it immediately
module TM
end

# Require all of our project files
require_relative 'task-manager/task.rb'
require_relative 'task-manager/project.rb'
require_relative 'task-manager/client.rb'


# cmds = {help: "Show these commands again",
#         list: "List all projects",
#         create_NAME: "Create a new project with name = NAME",
#         show_PID: "Show remaining tasks for project with id = PID",
#         history_PID: "Show completed tasks for project with id = PID",
#         add_PID_DESC_PRI: "Add a new task to project with id = PID",
#         mark_TID: "Mark task with id = TID as complete"}

puts "Welcome to Project Manager Pro©.  What can I do for you today? \n \nAvailable commands:\n"

TM::Client.cmds.each do |cmd, desc|
  puts "   #{cmd.to_s.gsub(/_/, ' ')} - #{desc}"
end

# TM::Client.run