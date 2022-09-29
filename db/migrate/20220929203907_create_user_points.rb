class CreateUserPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :user_points do |t|
      t.string :payer
      t.integer :points

      t.timestamps
    end
  end
end
