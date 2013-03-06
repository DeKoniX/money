class Person < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :debt, dependent: :destroy

  validates :name, presence: true
end
