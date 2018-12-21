# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :load_resource, only: %i[new edit show update]

  def index
    respond_to do |format|
      format.html
      format.json { render json: ReportDatatable.new(params, current_user: current_user, view_context: view_context) }
    end
  end

  def create
    current_user.reports.build(report_params).save
    redirect_to reports_path
  end

  def update
    if @report.update(report_params)
      redirect_to @report
    else
      render "edit"
    end
  end

  private

  def load_resource
    if params[:id]
      @report = Report.find_by_id(params[:id])
      return
    end

    @report = Report.new
  end

  def report_params
    params.require(:report).permit(:name, :location, :description, files: [])
  end
end
