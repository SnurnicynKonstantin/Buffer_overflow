class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [800, 800]

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :avatar do
    process :resize_to_fit => [32, 32]
  end

end
