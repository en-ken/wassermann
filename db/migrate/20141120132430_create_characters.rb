class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character
      t.string :freewords

      t.timestamps
    end
  end
end
