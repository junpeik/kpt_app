class Kpt < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC')}
  validates :keep, :problem, :try, presence: true
end
