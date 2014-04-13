class AddActiveToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :active, :boolean, default: true
  end
end
