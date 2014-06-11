
class TM::Project
  attr_reader :name, :id
  attr_accessor :tasks
  @@counter = 0
  @@tasks = []
  def initialize name
    @name = name
    @id = @@counter
    @@counter += 1
  end

  # def

  # end
  def get_completed_tasks
    list = []
    TM::Task.dock.each do |task|
      if task.project_id == @id
        if task.is_complete
          list << task
        end
      end
    end
    list.sort {|x, y| x.date_created <=> y.date_created}
    list
  end

  def get_incomplete_tasks
    list = []
    TM::Task.dock.each do |task|
      if task.project_id == @id
        if task.is_complete == false
          list << task
        end
      end
    end
    list.sort {|x, y| y.priority <=> x.priority}
  end

end

