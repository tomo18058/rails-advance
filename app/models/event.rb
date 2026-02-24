class Event < ApplicationRecord
  validates :title, presence: true
  validates :held_on, presence: true
  validates :organizer_name, presence: true
  validates :target_department, presence: true
  validates :description, presence: true

  scope :kept, -> { where(discarded_at: nil) }
end