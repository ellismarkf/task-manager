require 'spec_helper'

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

    task1 = TM::Task.new(project_id, "task1", 1)
    task2 = TM::Task.new(project_id, "task2", 2)
    task3 = TM::Task.new(project_id, "task3", 1)

    task1.complete
    task3.complete

    array = [task1, task3]

    expect(project.get_completed_tasks).to eq(array)

  end

end
