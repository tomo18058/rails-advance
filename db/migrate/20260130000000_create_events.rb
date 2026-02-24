class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :held_on
      t.string :organizer_name
      t.string :target_department

      t.timestamps
    end
  end
end
