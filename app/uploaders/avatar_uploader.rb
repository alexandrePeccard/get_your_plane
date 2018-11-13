class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :file

  process :resize_to_fit => [400, 400]

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end