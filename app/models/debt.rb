class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true 
  self.per_page = 100

  after_save :update_balance

  def update_balance
    person.update_balance
  end
end
