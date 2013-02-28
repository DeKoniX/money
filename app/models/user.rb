# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  tablecount      :integer          default(1)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :tablecount
  has_secure_password
  # has_many :finance, dependent: :destroy
  has_many :wallet
  has_many :finance, :through => :wallet

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :tablecount, presence: true, length: { minimum: 1, maximum: 4 }

  def create_remember_token
    self.update_column(:remember_token, SecureRandom.urlsafe_base64)
  end

  def update_count_table(count)
    if count < 5
      self.update_column(:tablecount, count)
    end
  end
end
