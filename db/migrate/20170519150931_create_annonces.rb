class CreateAnnonces < ActiveRecord::Migration[5.1]
  def change
    create_table :annonces do |t|
      t.string :titre
      t.string :description
      t.string :photo
      t.decimal :prix

      t.timestamps
    end
  end
end
