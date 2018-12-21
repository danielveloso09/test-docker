# frozen_string_literal: true

class FilterReportsFactory
  def create_service
    service = UserReportsService.new
    FilterReportsService.new(
      service: service
    )
  end
end
