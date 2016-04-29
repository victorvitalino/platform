require_dependency 'protocol/application_controller'

module Protocol
    class ReportsController < ApplicationController

        def new
          authorize :report,  :create?
          #@report = Report.new

              if params[:date_start].present? && params[:date_end].present?
                @date_start = Date.parse(params[:date_start])
                @date_end  = Date.parse(params[:date_end])
                @assessments = Assessment.joins(:subject,:document_type).
                select('document_number, protocol_document_types.name as doc_type_name, external_agency, protocol_subjects.name as subject_name, requesting_unit').
                where("protocol_assessments.created_at::date >= ?  AND protocol_assessments.created_at::date <= ? ", @date_start ,  @date_end )
              else
                @assessments = Assessment.joins(:subject,:document_type).
                select('document_number, protocol_document_types.name as doc_type_name, external_agency, protocol_subjects.name as subject_name, requesting_unit').
                where("protocol_assessments.created_at::date >= ?", Date.today)
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
