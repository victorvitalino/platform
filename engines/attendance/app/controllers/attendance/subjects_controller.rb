require_dependency "attendance/application_controller"

module Attendance
  class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    # GET /subjects
    def index
      @subjects = Subject.all
    end

    # GET /subjects/1
    def show
    end

    # GET /subjects/new
    def new
      @subject = Subject.new
    end

    # GET /subjects/1/edit
    def edit
    end

    # POST /subjects
    def create
      @subject = Subject.new(subject_params)

      if @subject.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /subjects/1
    def update
      if @subject.update(subject_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /subjects/1
    def destroy
      if @subject.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_subject
        @subject = Subject.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def subject_params
        params.require(:subject).permit(:name, :status)
      end
  end
end
