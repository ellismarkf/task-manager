
class TM::Task

  attr_reader :id, :description, :project_id, :date_created
  attr_accessor :is_complete, :priority, :dock

  @@counter = 0
  @@dock = []

  def self.dock
    @@dock
  end

  def initialize project_id, description, priority = 0
    @id = @@counter += 1
    @description = description
    @priority = priority
    @project_id = project_id
    @@dock << self
    @is_complete = false
    @date_created = Time.now
  end

  def complete
    @is_complete = true
  end

end
