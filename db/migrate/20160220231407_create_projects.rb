class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :features, array: true, default: []
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
