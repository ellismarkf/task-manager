require 'spec_helper'

describe 'Task' do
  let(:klass       ) { TM::Task }
  let(:description ) { "write code" }
  let(:is_complete ) { false }
  let(:priority    ) { 0 }
  let(:task        ) { klass.new(id, description, priority, is_complete) }
  let(:id          ) { 1 }

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
    task.complete(1)
    expect(task.is_complete).to eq(true)
  end
end
