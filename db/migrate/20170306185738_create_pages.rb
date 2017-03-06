class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.string :data
      t.string :password

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
