class User < ApplicationRecord
  has_many :user_content, dependent: :destroy
  has_many :contents, through: :user_content, dependent: :destroy

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :encrypted_password, presence: true
  validates :credit_card_number, presence: true
  validates :email, presence: true
  validates_confirmation_of :password

  def change_role
    new_role = is_manager ? false : true
    update_attribute(:is_manager, new_role)
  end
end
