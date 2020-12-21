class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string     :title,       null: false
      t.date       :date,        null: false
      t.string     :explanation, null: false
      t.references :user,        null: false, foreign_key: true
      t.integer    :location_id, null: false
      t.integer    :category_id, null: false

      t.timestamps
    end
  end
end
