# == Schema Information
#
# Table name: finances
#
#  id         :integer          not null, primary key
#  m          :decimal(, )
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  table      :integer          default(1)
#

class Finance < ActiveRecord::Base
  attr_accessible :desc, :m, :table
  belongs_to :user

  validates :user_id, presence: true
  validates :desc, length: { maximum: 140 }
  validates :m, presence: true
  validates :table, presence: true, length: { minimum: 1, maximum: 4 }
end
