class Conversion < ApplicationRecord
  belongs_to :user
  validates :from_currency, presence: true
  validates :to_currency, presence: true
  validates :amount, numericality: true, presence: true
  validate :custom_validations
  
  private
  def custom_validations
    if from_currency == to_currency
      errors.add(:to_currency,"can't be the same as base currency")
    end
    if !(["USD", "EUR", "CHF"].include? to_currency)
      errors.add(:to_currency,'must be one of the following "USD","EUR" or "CHF"' )
    end
    if !(["USD", "EUR", "CHF"].include? from_currency)
      errors.add(:to_currency,'must be one of the following "USD","EUR" or "CHF"' )
    end
  end
  
end
