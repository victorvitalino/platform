module Address
  class InformationsController < ApplicationController
    
    def cities
    end

    def states
    end

    def blocks
      return false unless params[:city_id].present?
      @blocks = Address::Unit.select(:block).where(city_id: params[:city_id]).order(:block).distinct

      render json: @blocks
    end

    def groups
      return false unless params[:block].present?
      @groups = Address::Unit.select(:group).where(city_id: params[:city_id], block: params[:block]).order(:group).distinct

      render json: @groups
    end

    def units
      return false unless params[:group].present?
     
      @units = Address::Unit.joins(:registry_units)
                            .where("address_units.city_id = ? AND address_units.block = ? AND address_units.group = ? AND address_units.program = 1", params[:city_id], params[:block], params[:group])
                            .where("address_registry_units.situation <> ?", 2)
                            .order(:id)

      render json: @units
    end

    def show_unit
      return false unless params[:unit].present?

      @unit = Address::Unit.joins(:registry_units)
                           .where("address_units.id = ? AND program = ?", params[:unit], 1)
                           .where("address_registry_units.situation <> ?", 2).first


      render json: @unit
    end


  end
end