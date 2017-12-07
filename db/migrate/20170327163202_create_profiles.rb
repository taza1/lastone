class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :profiles, :users
  end
end
