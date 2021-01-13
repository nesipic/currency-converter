class Conversion < ApplicationRecord
  belongs_to :user
  validates :from_currency, presence: true
  validates :to_currency, presence: true
  validates :amount, numericality: true, presence: true
  validate :custom_validations
  
  private
  def custom_validations
    if from_currency == to_currency
      errors.add(:to_currency,"can't be same")
    end
  end
  
end
