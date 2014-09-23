class CreateCookies < ActiveRecord::Migration
  def change
    create_table :cookies do |t|
      t.string :cookie_type
      t.boolean :gluten_free
      t.float :price
      t.references :monster, index: true

      t.timestamps
    end
  end
end
