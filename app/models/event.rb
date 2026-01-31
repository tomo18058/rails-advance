class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :held_on, presence: true
  validates :organizer, presence: true, length: { maximum: 100 }
  validates :target, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 1000 }

  scope :kept, -> { where(discarded_at: nil) }
end
