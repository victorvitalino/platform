module Patrimony
  class Drive < ActiveRecord::Base
    belongs_to :sector, class_name: "Person::Sector"
    belongs_to :user, class_name: "Person:User"
    belongs_to :good


     after_create :update_sector_good
 	
    private
    def update_sector_good
    		@drive_last = Drive.last
    		@good = Good.find(@drive_last.good_id)
    		@good.update(sector_id: @drive_last.sector.id)
        
    end
  end	
end
