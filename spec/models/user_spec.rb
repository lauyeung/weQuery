require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it 'should anonymize my name!!!' do
    anonymize = user.anonymizer
    expect(user.anonymizer).to_not eql(anonymize)
  end

end
