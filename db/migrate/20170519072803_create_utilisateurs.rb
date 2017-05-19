class CreateUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    create_table :annonces do |t|
      t.belongs_to :utilisateur
      t.string :titre
      t.string :description
      t.string :photo
      t.decimal :prix

      t.timestamps
    end

    create_table :utilisateurs do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :pseudo
      t.string :pass
      t.integer :promotion
      t.integer :telephone
      t.string :avatar

      t.timestamps
    end
  end
end

