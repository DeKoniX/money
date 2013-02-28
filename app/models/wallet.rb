# == Schema Information
#
# Table name: wallets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wallet < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :finance
end
