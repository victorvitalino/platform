require_dependency 'archive/application_controller'

module Archive
  class FilesController < ApplicationController
  
    def index
      @files = Archive::File.all.order('id DESC')
    end

    def new
      @file = Archive::File.new
    end

    def create
      @file = Archive::File.new(set_params)
      @file.staff_id  = current_user.id

      if @file.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy
    end

    private

    def set_params
      params.require(:file).permit(:original_name, :hash_name, :file_path, :staff_id, :sector_id)
    end

  end
end