module Protocol
    class ReportsController < ApplicationController
     layout 'layouts/material'

        def new
           @report = Report.new

           if params[:search].present?
              if params[:search][:date_start].present? && params[:search][:date_end].present?
                @date_start = params[:search][:date_start]
                @date_end  = params[:search][:date_end]
                @assessments = Assessment.joins(:subject,:document_type).
                select('document_number, protocol_document_types.name as doc_type_name, external_agency, protocol_subjects.name as subject_name, requesting_unit').
                where("protocol_assessments.created_at::date >= ?  AND protocol_assessments.created_at::date <= ? ", @date_start ,  @date_end )
              else
                @assessments = Assessment.joins(:subject,:document_type).
                select('document_number, protocol_document_types.name as doc_type_name, external_agency, protocol_subjects.name as subject_name, requesting_unit').
                where("protocol_assessments.created_at::date >= ?", Date.today)
              end
           else
                @assessments = Assessment.joins(:subject,:document_type).
                select('document_number, protocol_document_types.name as doc_type_name, external_agency, protocol_subjects.name as subject_name, requesting_unit').
                where("protocol_assessments.created_at::date>= ?", Date.today)
           end

              respond_to do |format|
                format.html
                format.csv { send_data @assessments.to_csv }

              end

        end

        private

        def set_params
            params.require(:report).permit(:date_start, :date_end)
         end
    end
end