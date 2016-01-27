require_dependency "cms/application_controller"

module Cms
  class VideosController < ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy]

    # GET /videos
    def index
      @videos = Video.all
      authorize @videos
    end

    # GET /videos/1
    def show

    end

    # GET /videos/new
    def new
      @video = Video.new
      authorize @video
    end

    # GET /videos/1/edit
    def edit

    end

    # POST /video
    def create
      @video = Video.new(video_params)
      authorize @video
      if @video.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /videos/1
    def update
      authorize @video
      if @video.update(video_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      authorize @video
      @video.destroy
      flash[:success] = t :success
      redirect_to videos_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_video
        @video = Cms::Video.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def video_params
        params.require(:video).permit(:title, :url, :position, :publish)
      end
  end
end
