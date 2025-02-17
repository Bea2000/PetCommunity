class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :adoptant
      t.belongs_to :user, foreign_key: true
      t.float :rating
      t.text :content

      t.timestamps
    end
  end
end
