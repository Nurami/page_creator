class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :data
      t.string :password

      t.timestamps
    end
  end
end
