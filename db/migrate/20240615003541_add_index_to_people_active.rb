class AddIndexToPeopleActive < ActiveRecord::Migration[6.1]
  def change
    add_index :people, :active
  end
end