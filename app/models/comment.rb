class Comment < ActiveRecord::Base

  validates :text, :author_id, :commentable_type, :commentable_id, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

end
