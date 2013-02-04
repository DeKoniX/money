# == Schema Information
#
# Table name: finances
#
#  id         :integer          not null, primary key
#  m          :decimal(, )
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Finance < ActiveRecord::Base
  attr_accessible :desc, :m
  belongs_to :user

  validates :user_id, presence: true
  validates :desc, length: { maximum: 140 }
  validates :m, presence: true
end
