class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :answer, presence: true
  validates :answer, length: { maximum: 280 }
end

