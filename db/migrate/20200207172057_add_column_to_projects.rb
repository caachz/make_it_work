class AddColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :challenge, foreign_key: true
  end
end
