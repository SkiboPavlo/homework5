#
class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments

  def admin
    User.where(role: 'admin')
    users.map { |u| u.email}
  end

  def comment
    comments.map { |c| c.description }
  end
end
