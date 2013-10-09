require 'spec_helper'

describe Question do
  it { should have_valid(:content).when('What is going on?', 'Please explain TDD.', 'Why are people clapping in these videos?') }
  it { should_not have_valid(:content).when(nil, '') }
end