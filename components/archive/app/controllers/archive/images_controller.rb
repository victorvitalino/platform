require_dependency 'archive/application_controller'

module Archive
  class ImagesController < ApplicationController
  
    def index
      @images = Archive::Image.all.order('id DESC')
    end

    def new
      @image = Archive::Image.new
    end

    def create
      @image = Archive::Image.new(set_params)
      @image.staff_id  = current_user.id

      if @image.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def upload_file
      @image = Archive::Image.new
      @image.file_path = params[:file]
      @image.staff_id  = current_user.id

      if @image.save
         render json: {
            image: {
              url: @image.file_path.url
            }
          }, content_type: "text/html"
      else
        render json: false
      end 
  
  end

    def destroy
    end

    private

    def set_params
      params.require(:image).permit(:original_name, :hash_name, :file_path, :staff_id, :sector_id)
    end

  end
end