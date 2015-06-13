class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :haiku
  validates_uniqueness_of :haiku_id, scope: :user_id
end
