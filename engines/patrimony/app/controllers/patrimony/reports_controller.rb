module Patrimony
  class ReportsController < ApplicationController


    def index
       @report = Good.new
       @codhab = Property.find_by_name('CODHAB/DF')
       @segeth = Property.find_by_name('SEGETH/DF')
       @goods_codhab = Good.property(@codhab).count
       @goods_segeth = Good.property(@segeth).count
       @goods = Good.all.count
    end

    def codhab
      @goods_codhab = Good.where(property: params[:property])
    end

   
    def sedhab
      @goods_sedhab = Good.where(property: params[:property])
    end
    
  end
end