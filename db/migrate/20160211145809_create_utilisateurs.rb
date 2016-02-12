class CreateUtilisateurs < ActiveRecord::Migration
  def change
    create_table :utilisateurs do |t|
      t.string :pseudo

      t.timestamps null: false
    end
  end
end
