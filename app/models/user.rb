class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true, length: { minimum: 1 }
  has_many :votes, dependent: :destroy
  has_many :upvoted_haikus, through: :votes, source: :haiku

  enum role: %w(default, admin)
end
