class FindersController < ApplicationController
  before_action :set_agenda

  def hours
    @date   = params[:date]
    render :json => @agenda.time_by_date(@date)
  end

  def new
    @finder = Finder.new
  end

  def create
    @finder = Finder.new(finder_params)
    if @finder.valid?
      @finders = @finder.search(@agenda.validate_sql)
    end
  end

  private

  def finder_params
    params.require(:finder).permit(:name, :cpf)
  end

  def set_agenda
    @agenda  = Agenda.find(params[:agenda_id])
  end
end