class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :donator  # , foreign_key: true
      t.string :state
      t.references :adoptant  # , foreign_key: true
      t.references :publication, foreign_key: true

      t.timestamps
    end
  end
end
