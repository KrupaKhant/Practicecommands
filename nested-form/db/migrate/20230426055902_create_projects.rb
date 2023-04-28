class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :project_type
      t.string :tech
      t.string :developer
      t.string :project_manager
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
