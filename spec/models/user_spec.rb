require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it 'should anonymize my name!!!' do
    anonymizer = double('anonymizer instance', generate_alias: 'foo')
    Anonymizer.stub(:new).and_return(anonymizer)

    user = User.new
    expect(user.anonymizer).to eq 'foo'
  end

end
