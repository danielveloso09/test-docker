# frozen_string_literal: true

class UserReportsService
  def get_reports(user:)
    return Report.all if user.admin?

    user.reports
  end
end
