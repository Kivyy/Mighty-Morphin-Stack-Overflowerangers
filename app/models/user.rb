class User < ActiveRecord::Base
  has_many :questions, {:foreign_key => :questioner_id}
  has_many :answers, {:foreign_key => :answerer_id}
  has_many :comments, {:foreign_key => :commenter_id}
  has_many :votes, {:foreign_key => :voter_id}

  validates :username, :email, presence: true, uniqueness: true
  validates :full_name, :hashed_password, presence: true

  def password
  @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

end
