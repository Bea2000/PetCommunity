class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :sender
      t.references :reciever
      t.references :chat
      t.text :content

      t.timestamps
    end
  end
end
