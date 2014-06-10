
class TM::Task
  attr_reader :id, :description
  attr_accessor :is_complete, :priority
  @@counter = 0
  def initialize id, description, priority = 0, is_complete=false
    @id = @@counter += 1
    @description = description
    @priority = priority
  end

  def complete(id)
    @is_complete = true
  end
end
