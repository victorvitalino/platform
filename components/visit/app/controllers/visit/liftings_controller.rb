require_dependency 'visit/application_controller'

module Visit
  class LiftingsController < ApplicationController
    before_action :set_lifting, only: [:show, :edit, :update, :destroy]

  has_scope :by_cpf
  has_scope :by_localization
  has_scope :by_name

  def index
    @lifts = apply_scopes(Visit::Lifting).all.order(:localization)
  end

    def show

    end

    # GET /posts/new
    def new
      @lifting = Lifting.new
    end

    # GET /posts/1/edit
    def edit

    end

    # POST /posts
    def create
      @lifting = Lifting.new(lifting_params)
      if @lifting.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @lifting.update(lifting_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @lifting.destroy
      redirect_to liftings_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_lifting
        @lifting = Visit::Lifting.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def lifting_params
        params.require(:lifting).permit( :localization ,:seal,:name,:naturality,:sex,:born,:cpf,:rg,:rg_org,:rg_org_date,:phone,:celphone,:retirement,:benefit,:pension,:nis,:income,:spouse_name,:spouse_born,:spouse_cpf,:spouse_rg,:spouse_rg_org,:spouse_rg_org_date,:deficiency,:deficiency_specification,:civil_status,:lot_situation,:lot_situation_time,:busy_lot,
                                         :busy_lot_user,:lot_vacated,:lot_vacated_description,:business_activities,:business_activities_description,:contractual_purpose,:contractual_purpose_description,:additional_information,:geolocation,:photo_one,:photo_two,:photo_three, :voi)
      end


    def new
    end
  end
end
