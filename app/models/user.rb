class User < ActiveRecord::Base

  validates :user_name, :email, presence: true
  validates :user_name, :email, uniqueness: true
  validate :validate_password

  has_many :questions, foreign_key: :author_id
  has_many :answers,  foreign_key: :author_id
  has_many :comments,  foreign_key: :author_id
  has_many :votes,  foreign_key: :voter_id

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

end
