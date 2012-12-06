require 'carrierwave/processing/mime_types'

class Mercury::ImageUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type

  version :medium do
    process :resize_to_fit => [300,300]
  end

  version :thumb do
    process :resize_to_fill => [100,100]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

end
