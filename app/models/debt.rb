class Debt < ActiveRecord::Base
  attr_accessible :desc, :m, :person_id
  belongs_to :person

  validates :desc, length: { maximum: 140 }
  validates :m, presence: true
  validates :person_id, presence: true
end
