class Person < ActiveRecord::Base
  belongs_to :user
  has_many :debt, dependent: :destroy

  validates :name, presence: true
end
