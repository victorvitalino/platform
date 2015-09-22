module Protocol
    class ReportsController < ApplicationController
     layout 'layouts/material'

        def new
           @report = Report.new
        end

        def  create
           @report = Report.new(set_params)

           if @report.date_start.present? && @report.date_end.present?
              @assessments = Assessment.where("created_at >= ? AND created_at <= ?", @report.date_start, @report.date_end)
           else
              @assessments = Assessment.where(created_at: Date.today)
           end

           render action: 'new'
        end

        private

        def set_params
            params.require(:report).permit(:date_start, :date_end)
         end
    end
end