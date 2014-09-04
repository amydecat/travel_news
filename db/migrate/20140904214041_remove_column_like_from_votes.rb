class RemoveColumnLikeFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :like, :boolean
  end
end
