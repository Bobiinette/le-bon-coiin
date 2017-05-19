class CreateUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    create_table :utilisateurs do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.integer :promotion
      t.integer :telephone
      t.string :avatar

      t.timestamps
    end
  end
end
