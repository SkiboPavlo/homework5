#
class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments

  def admin
    User.where(role: 'admin')
  end
end
