class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :held_on, presence: true
  validates :organizer_name, presence: true
  validates :target_department, presence: true

  scope :kept, -> { where(discarded_at: nil) }

  def formatted_held_on
    held_on&.strftime("%Y/%m/%d")
  end
end