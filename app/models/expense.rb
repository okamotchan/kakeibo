# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre      :string
#

class Expense < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :genre, presence: true
end
