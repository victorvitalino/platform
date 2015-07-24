module Protocol
    class SubjectsController < ApplicationController
        layout 'layouts/material'
        before_action :set_subjects, only: [:index, :create, :destroy, :update]
        before_action :set_subject, only: [:edit, :destroy, :update]

        def index
           authorize @subjects
        end

        def new
            @subject = Subject.new
            authorize @subject
        end

        def create
            @subject = Subject.new(subject_params)
            authorize @subject
            @subject.save
        end

        def edit
        end

        def update
            authorize @subject
            @subject.update(subject_params)
        end

        def destroy
            authorize @subject
            if @subject.destroy
                redirect_to action: 'index'
            end
        end

        private

        def subject_params
            params.require(:subject).permit(:name, :description,:status)
        end

        def set_subjects
            @subjects = Subject.all
        end

        def set_subject
            @subject = Subject.find(params[:id])
        end
    end
end
