require 'spec_helper'

describe Anonymizer, '#generate_alias' do
  it 'has a sample of the adjective array' do
    adjective_list = ['fuzzy']
    noun_list = ['dog']
    random_number = 1

    anonymizer = Anonymizer.new(adjective_list, noun_list, random_number)
    expect(anonymizer.generate_alias).to eq 'fuzzy-dog-0000'
  end

  it 'generates unique aliases' do
    anonymizer = Anonymizer.new
    expect(anonymizer.generate_alias).not_to eq anonymizer.generate_alias
  end
end
