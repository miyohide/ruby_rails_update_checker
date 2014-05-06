class AddRailsVersionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :rails_version, :string
  end
end
