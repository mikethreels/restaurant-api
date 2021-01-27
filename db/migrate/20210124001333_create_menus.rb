class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.json :items
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
