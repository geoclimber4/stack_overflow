class Answer < ActiveRecord::Base

  validates :text, :author_id, :question_id, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

end
