require 'spec_helper'

# before(:each) do
#   TM::Project.class_variable_set :@@counter, 0
# end


describe 'Project' do
  let(:klass  ) { TM::Project }
  let(:name   ) { "example" }
  let(:project) { klass.new(name)}

  it "exists" do
    expect(klass).to be_a(Class)
  end

  it "initializes with a name" do
    expect(project.name).to eq(name)
  end

  it "has a project id" do
    expect(project.id).to eq(1)
  end

  # it "can add tasks to a project id" do

  # end

  it "can list all completed tasks" do
    project
    project_id = project.id

    Time.stub(:now).and_return(Time.parse("June 7 2014"))
    task1 = TM::Task.new(project_id, "task1", 1)

    Time.stub(:now).and_return(Time.parse("June 8 2014"))
    task2 = TM::Task.new(project_id, "task2", 2)

    Time.stub(:now).and_return(Time.parse("June 9 2014"))
    task3 = TM::Task.new(project_id, "task3", 3)

    Time.stub(:now).and_return(Time.parse("June 10 2014"))
    task4 = TM::Task.new(project_id, "task4", 4)

    Time.stub(:now).and_return(Time.parse("June 11 2014"))
    task5 = TM::Task.new(project_id, "task5", 4)

    task1.complete
    task3.complete
    task5.complete

    array = [task1, task3, task5]

    expect(project.get_completed_tasks).to eq(array)

  end

  it "can list all incomplete tasks sorted by priority number" do
    project
    project_id = project.id

    Time.stub(:now).and_return(Time.parse("June 7 2014"))
    task1 = TM::Task.new(project_id, "task1", 1)

    Time.stub(:now).and_return(Time.parse("June 8 2014"))
    task2 = TM::Task.new(project_id, "task2", 2)

    Time.stub(:now).and_return(Time.parse("June 9 2014"))
    task3 = TM::Task.new(project_id, "task3", 3)

    Time.stub(:now).and_return(Time.parse("June 10 2014"))
    task4 = TM::Task.new(project_id, "task4", 4)

    Time.stub(:now).and_return(Time.parse("June 11 2014"))
    task5 = TM::Task.new(project_id, "task5", 4)

    array = [task4, task5, task3, task2, task1]

    expect(project.get_incomplete_tasks).to eq(array)
  end

end
