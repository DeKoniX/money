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
#  wallet_id  :integer
#

class Finance < ActiveRecord::Base
  belongs_to :wallet

  validates :desc, length: { maximum: 140 }
  validates :m, presence: true
  validates :wallet_id, presence: true
end
