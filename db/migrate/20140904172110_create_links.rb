class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :headline
      t.string :website

      t.timestamps
    end
  end
end
