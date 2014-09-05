class SetDefaultInColumnTally < ActiveRecord::Migration
  def change
    remove_column :links, :tally

    add_column :links, :tally, :integer, default: 0
  end
end
