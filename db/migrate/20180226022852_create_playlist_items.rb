class CreatePlaylistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_items do |t|
      t.references :playlist, foreign_key: true
      t.integer :duration, null: false, default: 10
      t.integer :position, null: false

      t.references :poster, foreign_key: true

      t.timestamps

      t.timestamp :destroyed_at, nullable: true, default: nil
    end
  end
end
