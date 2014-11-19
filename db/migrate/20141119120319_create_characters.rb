class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character
      t.string :keywords

      t.timestamps
    end
  end
end
