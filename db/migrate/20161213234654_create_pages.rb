class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :url
      t.string :h1, array: true
      t.string :h2, array: true
      t.string :h3, array: true

      t.timestamps
    end
  end
end
