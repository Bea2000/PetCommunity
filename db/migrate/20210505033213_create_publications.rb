class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      # t.integer :uid
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.integer :price
      t.string :direction
      t.string :species
      t.string :kind

      t.timestamps
    end
  end
end
