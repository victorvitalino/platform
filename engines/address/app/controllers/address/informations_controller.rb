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
      @units = Address::Unit.select(:unit)
                            .where(city_id: params[:city_id],
                                   block: params[:block],
                                   group: params[:group])
                            .order(:unit)

      render json: @units
    end

    def show_unit
      return false unless params[:unit].present?
      @unit = Address::Unit.select(:id)
                            .where(city_id: params[:city_id],
                                   block: params[:block],
                                   group: params[:group],
                                   unit: params[:unit]).first
      render json: @unit
    end


  end
end