require_dependency 'protocol/application_controller'

module Protocol
    class SolicitationRepliesController < ApplicationController
        before_action :set_solicitation
        before_action :set_solicitation_replies, only: [:index, :create, :destroy, :update]
        before_action :set_solicitation_reply, only: [:edit, :destroy, :update, :show]

        def index
          authorize :solicitation_reply,  :index?
        end

        def new
            authorize :solicitation_reply,  :create?
            @solicitation_reply = @solicitation.solicitation_replies.new

        end

        def create
            authorize :solicitation_reply,  :create?

            @solicitation_reply = @solicitation.solicitation_replies.new(solicitation_params)

              @solicitation_reply.save
              redirect_to action: 'index'

        end

        def edit
        end

        def show
          authorize :solicitation_reply,  :index?
        end

        def update
            authorize :solicitation_reply,  :update?
            @solicitation_reply.update(solicitation_params)
        end

        def destroy
            authorize :solicitation_reply,  :destroy?
            if @solicitation_reply.destroy
                redirect_to action: 'index'
            end
        end

        private

        def solicitation_params
            params.require(:solicitation_reply).permit(:providence_id, :providence_date,:providence_staff_id, :process_delivered,:delivered_date, :responsible_delivered_id, :observation, :authenticate_id, :authenticate_date)
        end

        def set_solicitation
            @solicitation = Solicitation.find(params[:solicitation_id])
        end

        def set_solicitation_replies
           @solicitation_replies = @solicitation.solicitation_replies.all
        end

        def set_solicitation_reply
            @solicitation_reply = SolicitationReply.find(params[:id])
        end
    end
end
