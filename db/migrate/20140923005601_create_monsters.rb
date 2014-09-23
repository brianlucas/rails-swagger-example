class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role
      t.string :color

      t.timestamps
    end
  end
end
