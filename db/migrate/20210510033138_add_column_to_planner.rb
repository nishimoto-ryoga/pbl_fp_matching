class AddColumnToPlanner < ActiveRecord::Migration[6.1]
  def change
    add_column :planners, :name, :string
  end
end
