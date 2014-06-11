class TM::Client

  @@cmds = {help: "Show these commands again",
            list: "List all projects",
            create_NAME: "Create a new project with name = NAME",
            show_PID: "Show remaining tasks for project with id = PID",
            history_PID: "Show completed tasks for project with id = PID",
            add_PID_DESC_PRI: "Add a new task to project with id = PID",
            mark_TID: "Mark task with id = TID as complete"}

  def self.run
    user_input = gets.chomp
    splitted = user_input.split

    cmd = splitted[0]

    parse(cmd, splitted)
  end

  def parse
    case cmd
    when "help"
      list_cmds
    when "list"
      list_projects(splitted[1..-1])
    when "create"
      create_project(splitted[1..-1])
    when "show"
      remaining_tasks(splitted[1..-1])
    when "history"
      show_completed(splitted[1..-1])
    when "add"
      new_task(splitted[1..-1])
    when "mark"
      mark_as_complete(splitted[1..-1])
    else
      "Sorry, that's not a recognized command."
    end
    run
  end

  def list_cmds
    @@cmds.each do |cmd, desc|
      puts "   #{cmd.to_s.gsub(/_/, ' ')} - #{desc}"
    end
  end

  def list_projects(input_array)
    TM::Project.projects.each {|project| puts project.name}
  end

  def new_task(input_array)
    pid  = input_array[1].to_i
    pri  = input_array[2].to_i
    desc = input_array[3..-1].join(" ")
    TM::Task.new(pid, desc, pri)
  end


  def self.cmds
    @@cmds
  end

end