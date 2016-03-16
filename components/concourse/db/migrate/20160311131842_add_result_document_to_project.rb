class AddResultDocumentToProject < ActiveRecord::Migration
  def change
    add_column :concourse_projects, :result_document, :string
  end
end
