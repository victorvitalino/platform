require_dependency 'api/application_controller'

module Api
  module Address
    class UnitsController < ApplicationController

      def show
        return false unless params[:unit_id].present?

        @unit = ::Address::Unit.find(params[:unit_id])

        render json: @unit
      end

      def blocks
        return false unless params[:city_id].present?
        @blocks = ::Address::Unit.select(:block).where(city_id: params[:city_id]).order(:block).distinct

        render json: @blocks
      end

      def groups
        return false unless params[:block].present?
        @groups = ::Address::Unit.select(:group).where(city_id: params[:city_id], block: params[:block]).order(:group).distinct

        render json: @groups
      end

      def units
        return false unless params[:group].present?

        @units = ::Address::Unit.where(city_id: params[:city_id], block: params[:block], group: params[:group], program: 1)
                                .joins(:registry_units)
                                .where("address_registry_units.situation <> ?", 2).order(:id)
=begin
        @units = ::Address::Unit.where("address_units.city_id = ? AND address_units.block = ? AND address_units.group = ? AND address_units.program = 1", params[:city_id], params[:block], params[:group])
                                .joins("address_registry_units")
                                .where("address_registry_units.situation <> ?", 2).order(:id)
=end
        render json: @units
      end

      def all_units
        return false unless params[:group].present?

        @units = ::Address::Unit.where(city_id: params[:city_id], block: params[:block], group: params[:group], program: 1)
                                .joins(:registry_units).order(:id)

        render json: @units
      end

    end
  end
end