class RelationBetweenUserAndAddress < ActiveRecord::Migration[5.2]

  # Allows users to have multiple addresses
  def change
     add_reference :addresses, :user, index: true
  end
end
