class Haiku < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :upvoted_users, through: :votes, source: :user
end
