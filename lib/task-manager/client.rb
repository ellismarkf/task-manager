class TM::Client

  @@cmds = {help: "Show these commands again",
            list: "List all projects",
            create_NAME: "Create a new project with name = NAME",
            show_PID: "Show remaining tasks for project with id = PID",
            history_PID: "Show completed tasks for project with id = PID",
            add_PID_PRI_DESC: "Add a new task to project with id = PID",
            mark_TID: "Mark task with id = TID as complete",
            quit: "Exit the program."}

  def self.run
    user_input = gets.chomp
    splitted = user_input.split

    cmd = splitted[0]

    parse(cmd, splitted)
  end

  def self.parse(cmd, splitted)
    case cmd
    when "help"
      list_cmds
    when "list"
      list_projects([1..-1])
    when "create"
      create_project(splitted[1..-1])
    when "show"
      remaining_tasks(splitted[1].to_i)
    when "history"
      show_completed(splitted[1].to_i)
    when "add"
      new_task(splitted[1..-1])
    when "mark"
      mark_as_complete(splitted[1].to_i)
    # when "quit"
    #   quit
    else
      puts "Sorry, that's not a recognized command."

    end
    run
  end

  def self.list_cmds
    @@cmds.each do |cmd, desc|
      puts "   #{cmd.to_s.gsub(/_/, ' ')} - #{desc}"
    end
    run
  end

  def self.list_projects(input_array)
    puts "Current Task Projects: \n"
    if TM::Project.projects.count == 0
      puts "There are no current projects. Create one with the 'create' command. \n"
    else
      puts "Project Name:      Project ID:\n----------------------------------"
      TM::Project.projects.each {|project| puts "#{project.name}:         #{project.id}"}
    end
  end

  def self.create_project(input_array)
    TM::Project.new(input_array[0..-1].join(" "))
  end

  def self.remaining_tasks(id)
    puts "Remaining tasks for #{(TM::Project.projects[id]).name}:"
    project_tasks = TM::Project.projects.find { |prj| prj.id == id }

    project_tasks.get_incomplete_tasks

    # get_incomplete_tasks.each do |task|
    #       puts "Task #{task.id}: #{task.description}"
    # end
  end

  def self.show_completed(id)
    puts "Completed tasks for #{(TM::Project.projects[id]).name}:"
    TM::Project.projects.select do |prj|
      if prj.id == id
        prj.get_completed_tasks.each do |task|
          puts "Task #{task.id}: #{task.description} "
        end
      end
    end
  end

  def self.new_task(input_array)
    pid  = input_array[1].to_i
    pri  = input_array[2].to_i
    desc = input_array[2..-1].join(" ")
    task = TM::Task.new(pid, pri, desc)

    puts "Task #{task.id} has been created and assigned to project #{(TM::Project.projects[pid]).name}."
  end

  def self.mark_as_complete(task_id)
    TM::Task.dock[task_id-1].complete
    puts "Task #{TM::Task.dock[task_id-1].id} has been marked as complete."
  end


  def self.cmds
    @@cmds
  end

  # def self.quit
  #   parse.exit(true)
  #   run.exit(true)
  # end

end