class AddColumnTally < ActiveRecord::Migration
  def change
    add_column :links, :tally, :integer
  end
end
