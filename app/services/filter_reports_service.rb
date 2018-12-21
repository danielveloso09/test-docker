# frozen_string_literal: true

class FilterReportsService
  def initialize(service:)
    @service = service
  end

  def filter_reports(user:, filters: {})
    reports = service.get_reports(user: user)

    return reports if filters.empty?

    reports.where(filters)
  end

  private

  attr_reader :service
end
