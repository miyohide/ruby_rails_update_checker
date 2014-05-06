class AddRubyTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ruby_type, :string
  end
end
