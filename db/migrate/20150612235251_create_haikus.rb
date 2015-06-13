class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |t|
        t.text :title
        t.text :line1
        t.text :line2
        t.text :line3

        t.timestamps null: false
    end
  end
end
