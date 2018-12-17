require 'rails_helper'

RSpec.describe UserContent, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:content) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:content_id) }
end
