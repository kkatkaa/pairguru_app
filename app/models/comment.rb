class Comment < ApplicationRecord
  validates :user_id, uniqueness: { scope: :movie_id, message: "you've already made a comment! Click 'edit' to change your comment." }
  validates :body, presence: true, length: { in: 5..500 }

  belongs_to :movie
  belongs_to :user
end
