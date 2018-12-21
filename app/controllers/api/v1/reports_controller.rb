# frozen_string_literal: true

module Api
  module V1
    class ReportsController < Api::BaseController
      def filter
        json_response filter_reports
      end

      private

      def filter_reports
        attributes = {
          user: current_user,
          filters: filter_params
        }

        FilterReportsFactory.new.create_service.filter_reports(attributes)
      end

      def filter_params
        params.permit(:location).to_h.symbolize_keys
      end
    end
  end
end
