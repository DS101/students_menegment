class Student < ApplicationRecord
  enum gender: [:female, :male]
  validates :name, :gender, :surname, presence: true
  validates :cognomen, uniqueness: true, allow_nil: true
  validates :cognomen, length: { in: 6..20 }, allow_nil: true

  # scope :filter_by_gender, -> { where(gender: '1') }
  scope :filter_by_gender, -> (gender) { where gender: gender }
end
