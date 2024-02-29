class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true, length: { minimum: 6, message: 'should not be shorter than 6' }
  validates :movie_id, uniqueness: { scope: :list_id }
end
