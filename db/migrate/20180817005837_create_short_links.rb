class CreateShortLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :short_links do |t|
      t.string :url
      t.string :friendly_id

      t.timestamps
    end

    add_index :short_links, :friendly_id
  end
end
