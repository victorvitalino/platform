class AddSystemModuleToSystem < ActiveRecord::Migration
  def change
    add_reference :person_systems, :system_module, index: true
  end
end
