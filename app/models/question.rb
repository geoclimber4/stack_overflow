class Question < ActiveRecord::Base

  validates :title, :text, :author_id, presence: true

  belongs_to :author, class_name: "User"
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  def vote_sum
    self.votes.sum(:value)
  end

end
