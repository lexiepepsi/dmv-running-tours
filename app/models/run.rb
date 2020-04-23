# == Schema Information
#
# Table name: runs
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  distance    :integer
#  duration    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Run < ApplicationRecord
  validates :name, uniqueness: { scope: :location }
end
