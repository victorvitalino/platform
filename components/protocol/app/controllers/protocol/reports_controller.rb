require_dependency 'protocol/application_controller'

module Protocol
    class ReportsController < ApplicationController

       has_scope :date_start
       has_scope :date_end
       has_scope :subject
       has_scope :doc_type
       has_scope :sector

        def new
          authorize :report,  :create?
          #@report = Report.new

              if params[:date_start].present? && params[:date_end].present?
                @assessments = Assessment.joins(:subject,:document_type).
                select('document_number, protocol_document_types.name as doc_type_name, external_agency, protocol_subjects.name as subject_name, requesting_unit')
                @assessments = apply_scopes(@assessments)
              end

              respond_to do |format|
                format.html
                format.xlsx  { response.headers['Content-Disposition'] = 'attachment; filename="relatorio_remessa.xlsx"' }
              end
        end

        def general_report

          authorize :report,  :index?

          if params[:date_start].present? || params[:date_end].present? || params[:doc_type].present? || params[:subject].present? || params[:sector].present?
            @assessments = Assessment.joins(:subject,:document_type).
            select('document_number,recipient, protocol_assessments.created_at, protocol_document_types.name as doc_type_name,protocol_subjects.name as subject_name, requesting_unit')
            @assessments = apply_scopes(@assessments)
          end

          respond_to do |format|
            format.html
            format.xlsx  { response.headers['Content-Disposition'] = 'attachment; filename="relatorio_processos.xlsx"' }
        end

        end

        private

        def set_params
            params.require(:report).permit(:date_start, :date_end)
        end
    end
end
