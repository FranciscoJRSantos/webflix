require 'rails_helper'
require 'faker'

RSpec.describe Content, type: :model do
  subject {
    create(:content)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without director' do
    subject.director = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without year' do
    subject.year = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without category' do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without file_path' do
    subject.file_path = nil
    expect(subject).to_not be_valid
  end
end
