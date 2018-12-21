# frozen_string_literal: true

class ApplicationDatatable < AjaxDatatablesRails::ActiveRecord
  def current_user
    @current_user ||= options[:current_user]
  end

  def view_context
    @view_context ||= options[:view_context]
  end
end
