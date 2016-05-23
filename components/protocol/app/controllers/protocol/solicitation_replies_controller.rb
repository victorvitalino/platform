require_dependency 'protocol/application_controller'

module Protocol
    class SolicitationRepliesController < ApplicationController
        before_action :set_solicitation, excepty: [:validate]
        before_action :set_solicitation_replies, only: [:index, :create, :destroy, :update]
        before_action :set_solicitation_reply, only: [:edit, :destroy, :update, :show]
        before_action :set_validate, only: [:validate]

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

            if @solicitation_reply.save
              redirect_to action: 'index'
            else
              render :new
            end
        end

        def edit
        end

        def validate
          @solicitation_reply.update(authenticate_id: current_user.id, authenticate_date: Date.today)
          redirect_to action: 'index'
        end

        def show
          authorize :solicitation_reply,  :index?
        end

        def update
            authorize :solicitation_reply,  :update?
            if @solicitation_reply.update(solicitation_params)
              redirect_to action: 'index'
            else
              render :edit
            end
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

        def set_validate
          @solicitation_reply = SolicitationReply.find(params[:solicitation_reply_id])
        end
    end
end
