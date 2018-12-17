require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  subject {
    create(:user)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without credit_card_number' do
    subject.credit_card_number = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end
end
