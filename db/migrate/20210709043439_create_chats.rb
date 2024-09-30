class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :adoptant
      t.references :donator

      t.timestamps
    end
  end
end
