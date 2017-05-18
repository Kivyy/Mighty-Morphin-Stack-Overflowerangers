class Answer < ActiveRecord::Base
  belongs_to :answerer, {class_name: "User"}
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :response, presence: true
end
