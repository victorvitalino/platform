module Person
  class DocumentsController < ApplicationController

    layout 'shared/empty'

    before_action :set_staff, only:[:new, :show]

    HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    START_DAY = :sunday

    def index

    end

    def new
      @document = Person::Document.new
    end



    def show
      @array_holiday = params[:holidays].present? ? params[:holidays].split(';') : "0"
      @array_vocations = params[:vocations].present? ? params[:vocations].split(';') : "0"
      @array_outhers = params[:outhers].present? ? params[:outhers].split(';') : "0"
      @array_before_noon = params[:before_noon].present? ? params[:before_noon].split(';') : "0"
      @array_afternoon= params[:afternoon].present? ? params[:afternoon].split(';') : "0"
      @outhers = params[:outhers_label].upcase if params[:outhers_label].present?
      @before_noon = params[:before_noon_label].upcase if params[:before_noon_label].present?
      @afternoon = params[:afternoon_label].upcase if params[:afternoon_label].present?
      @date = Date.parse("#{params[:year_search]}-#{params[:month_search]}-1")
      @date_search = (@date.end_of_month.strftime('%d').to_i - @date.beginning_of_month.strftime('%d').to_i) + 1
    end

    private

    def set_staff
      @staff = Person::Staff.find(params[:staff_id])
    end

  end
end
