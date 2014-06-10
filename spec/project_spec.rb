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

end
