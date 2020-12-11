class Student < ApplicationRecord
  enum gender: [:female, :male]
  validates :name, :gender, :surname, presence: true
  validates :cognomen, uniqueness: true, allow_nil: true
  validates :cognomen, length: { in: 6..20 }, allow_nil: true
end
