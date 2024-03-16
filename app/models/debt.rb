class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true 
  self.per_page = 100
end
