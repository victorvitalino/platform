class AddProfessionToCadastres < ActiveRecord::Migration
  def change
    add_reference :action_cadastres, :profession, index: true
  end
end
