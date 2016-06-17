class AddFormationAreaToCadastres < ActiveRecord::Migration
  def change
    add_reference :action_cadastres, :formation_area, index: true
  end
end
