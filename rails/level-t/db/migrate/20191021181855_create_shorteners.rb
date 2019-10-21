class CreateShorteners < ActiveRecord::Migration[5.2]
  def change
    create_table :shorteners do |t|
      t.string :original_url, null: false, default: ""
      t.string :shorted_url, null: false, default: ""
      t.integer :visits, null: false, default: 0

      t.timestamps
    end
  end
end
