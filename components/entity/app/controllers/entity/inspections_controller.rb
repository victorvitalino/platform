require_dependency 'entity/application_controller'
module Entity
  class InspectionsController < ApplicationController
    before_action :set_cadastre
    before_action :set_inspection, only: [:show, :edit, :update, :destroy]
    layout 'patternfly/mobile-less-application'

    def show

    end

    # GET /posts/new
    def new
      @inspection = @cadastre.inspections.new
    end

    # GET /posts/1/edit
    def edit

    end

    # POST /posts
    def create
      @inspection = @cadastre.inspections.new(inspection_params)
      if @inspection.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @inspection.update(inspection_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @inspection.destroy
      redirect_to inspections_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_inspection
        @inspection = @cadastre.inspections.find(params[:id])
      end
      def set_cadastre
        @cadastre = Entity::Cadastre.find(params[:cadastre_id])
      end

      # Only allow a trusted parameter "white list" through.
      def inspection_params
        params.require(:inspection).permit( :cadastre_id ,:address_optional,:general_photo_1,:general_photo_2,:general_photo_3,:size,:property_type,:property_owner,:property_description,:others_local,:operating_time,:location_time,:meeting_frequency,:elected,:action_area,:associated_amount,:business_hour,:business_days,:inspection_type,:attorney,:attorney_name,:documentation_photo_1,:documentation_photo_2,:responsible_rg,:responsible_cpf,:responsible_name,:responsible_title,:responsible_title,:responsible_photo,
        :responsible_phone, :occupied_property, :additional_information)
      end
  end
end
