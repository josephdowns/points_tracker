class CreateUserPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :user_points do |t|
      t.string :payer
      t.integer :points
      t.references :user, null: false, foreign_key: true
      t.references :payer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
