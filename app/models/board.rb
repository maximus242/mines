class Board < ApplicationRecord
  validates :height, numericality: { only_integer: true }
  validates :width, numericality: { only_integer: true }
  validates :number_of_mines, numericality: { only_integer: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
end
