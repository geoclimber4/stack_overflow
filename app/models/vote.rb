class Vote < ActiveRecord::Base
  validates :voter_id, :votable_id, :votable_type, :value, presence: true

  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User"

  # put a
end
