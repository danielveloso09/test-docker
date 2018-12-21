# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user

  # Uploaders
  mount_uploaders :files, AttachmentUploader
  serialize :files, JSON
end
