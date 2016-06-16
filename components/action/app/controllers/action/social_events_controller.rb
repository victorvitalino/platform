module Action
  class SocialEventsController < ApplicationController
    before_action :set_social_event, only: [:show, :edit, :update, :destroy]

    def index
      @events = Action::SocialEvent.all
    end

    def show

    end

    # GET /posts/new
    def new
      @event = SocialEvent.new
    end

    # GET /posts/1/edit
    def edit

    end

    # POST /posts
    def create
      @event = SocialEvent.new(social_event_params)
      if @event.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @event.update(social_event_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @event.destroy
      redirect_to social_events_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_social_event
        @event = Action::SocialEvent.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def social_event_params
        params.require(:social_event).permit(:name, :status, :date, :description, :localization, :city, :situation)
      end
  end
end
