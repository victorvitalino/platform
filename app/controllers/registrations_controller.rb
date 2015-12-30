class RegistrationsController < Devise::RegistrationsController
  layout 'material'

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    
    if resource_updated
      self.resource.account.update(password_change: Date.today)
      sign_in resource_name, resource, bypass: true
      
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
end