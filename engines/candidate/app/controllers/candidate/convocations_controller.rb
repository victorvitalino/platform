module Candidate
  class ConvocationsController < ApplicationController
    
    def index
      @convocations = Convocation.all
    end

    def new
      @convocation = Convocation.new
    end

    def create
      @convocation = Convocation.new(set_params)
      if @convocation.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @convocation.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end


    def destroy
      if @convocation.destroy
        
      end
    end

    private

    def set_params
      params.require(:convocation).permit(:)
    end
  end
end