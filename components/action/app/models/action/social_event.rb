module Action
  class SocialEvent < ActiveRecord::Base
    belongs_to :localization
    belongs_to :city
  end
end
