class Kpt < ActiveRecord::Base
  validates :keep, :problem, :try, presence: true
end
