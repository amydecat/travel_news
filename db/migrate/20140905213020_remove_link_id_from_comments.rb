class RemoveLinkIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :link_id, :integer
  end
end
