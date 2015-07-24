# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  process convert: 'png'

  version :default_x2 do
    process resize_to_limit: [1920, 1188]
  end

  version :default_x1, from_version: :default_x2 do
    process scale: 0.5
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def full_filename(for_file)
    # format exmaple: '1-original.png', '1-x1.png'
    "#{model.id}-#{version_name || 'original'}.png"
  end

  def scale(multiplier)
    dimensions = ::MiniMagick::Image.open(file.file)[:dimensions]
    resize_to_fill(dimensions[0] * multiplier, dimensions[1] * multiplier)
  end
end
