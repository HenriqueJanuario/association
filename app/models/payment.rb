class Payment < ApplicationRecord
  belongs_to :person

  after_save :update_balance

  def update_balance
    person.update_balance
  end
end
