# frozen_string_literal: true

class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file
end
