class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :url
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
