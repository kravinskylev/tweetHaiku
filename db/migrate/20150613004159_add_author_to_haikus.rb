class AddAuthorToHaikus < ActiveRecord::Migration
  def change
    add_column :haikus, :author, :string
  end
end
