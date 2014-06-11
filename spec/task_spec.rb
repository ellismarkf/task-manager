require 'spec_helper'

describe 'Task' do
  let(:klass       ) { TM::Task }
  let(:description ) { "write code" }
  let(:is_complete ) { false }
  let(:priority    ) { 0 }
  let(:task        ) { klass.new(project_id, description, priority) }
  let(:id          ) { 1 }
  let(:project_id  ) { 1 }

  # before each do
  #   task = TM::Task.new()

  it "exists" do
    expect(TM::Task).to be_a(Class)
  end

  it "has an id, description, and priority number " do
    expect(task.id).to eq(1)
    expect(task.description).to eq('write code')
    expect(task.priority).to eq(0)
  end

  it "can be marked as complete" do
    task.complete
    expect(task.is_complete).to eq(true)
  end

  # it "returns all tasks" do
  #   task
  #   task
  #   task
  #   expect()
  # end

  # it "can be added to project by id" do
  #   TM::Task.add_to_project(1)
  #   expect(Task.dock.size).to eq(1)
  # end

end
