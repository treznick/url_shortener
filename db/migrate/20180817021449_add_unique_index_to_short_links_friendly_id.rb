class AddUniqueIndexToShortLinksFriendlyId < ActiveRecord::Migration[5.2]
  def change
    remove_index(:short_links, :friendly_id)
    add_index(:short_links, :friendly_id, unique: true)
  end
end
