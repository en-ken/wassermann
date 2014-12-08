class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.string :img_url
      t.string :freewords

      t.timestamps
    end
  end
end
