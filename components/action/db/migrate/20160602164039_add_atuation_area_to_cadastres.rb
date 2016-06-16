class AddAtuationAreaToCadastres < ActiveRecord::Migration
  def change
    add_reference :action_cadastres, :atuation_area, index: true
  end
end
