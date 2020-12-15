class Student < ApplicationRecord
  enum gender: [:female, :male]
  validates :name, :gender, :surname, presence: true
  validates :cognomen, uniqueness: true, allow_nil: true, allow_blank: true
  validates :cognomen, length: { in: 6..20 }, allow_nil: true, allow_blank: true

  scope :filter_by_selected_gender, -> (gender) { where gender: gender }
  scope :filter_by_selected_surname, -> (name) { where("surname like ?", "%#{name}%")}
end
