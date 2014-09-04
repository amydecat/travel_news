class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.varchar :headline
      t.varchar :website

      t.timestamps
    end
  end
end
