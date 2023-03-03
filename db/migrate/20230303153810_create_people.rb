class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :stage, default: 0
      t.integer :probability
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
