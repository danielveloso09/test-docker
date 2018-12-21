# frozen_string_literal: true

class ReportDatatable < ApplicationDatatable
  extend Forwardable

  def_delegator :view_context, :link_to

  def view_columns
    @view_columns ||= {
      id: { source: 'Report.id', searchable: false },
      user: { source: 'Report.user.email', orderable: false, searchable: false },
      name: { source: 'Report.name', searchable: false },
      location: { source: 'Report.location', cond: :like, searchable: true },
      created_at: { source: 'Report.created_at', cond: :like, searchable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        user: record.user.email,
        name: link_to(record.name, record),
        location: record.location,
        created_at: record.created_at.strftime('%Y-%m-%d'),
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    UserReportsService.new.get_reports(user: current_user)
  end
end
