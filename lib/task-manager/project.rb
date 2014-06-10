
class TM::Project
  attr_reader :name, :id
  @@counter = 0
  def initialize name
    @name = name
    @id = @@counter
    @@counter += 1
  end
end
