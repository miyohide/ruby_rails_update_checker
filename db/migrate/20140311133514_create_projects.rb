class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :person_in_charge
      t.string :contact_address

      t.timestamps
    end
  end
end
