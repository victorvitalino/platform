module Patrimony
  class DownGood < ActiveRecord::Base
    belongs_to :good

    enum :name => [:ocioso, :anti_econômico, :irrecuperável]

    after_create :update_good
 	
 	private
    def update_good
    	@down_good_last = DownGood.last
    	@good = Good.find(@down_good_last.good_id)
    	@good.update(status: false)
    end


  end
end
