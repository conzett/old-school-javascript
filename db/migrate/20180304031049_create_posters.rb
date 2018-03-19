class CreatePosters < ActiveRecord::Migration[5.2]
  def change
    create_table :posters do |t|
      t.string :name, null: false
      t.string :name_parameterized, null: false

      t.timestamps
    end
  end
end
