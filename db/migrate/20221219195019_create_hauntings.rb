class CreateHauntings < ActiveRecord::Migration[6.1]
  def change
    create_table :hauntings do |t|
      t.belongs_to :ghost
      t.belongs_to :haunted_house

      t.timestamps
    end
  end
end
