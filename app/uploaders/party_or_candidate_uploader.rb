class PartyOrCandidateUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  process scale: [300,300]
  process resize_to_fill: [300, 300]
  process :optimize

  def scale(width, height)
    resize_and_pad width, height, :transparent, Magick::CenterGravity
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def optimize
    manipulate! do |image|
      image.write(current_path){ self.interlace = Magick::PlaneInterlace}
      image = yield(image) if block_given?
      image
    end
  end

  version :normal do
    process scale: [250, 250]
    process :optimize
  end

  version :middle do
    process scale: [200, 200]
    process :optimize
  end

  version :small do
    process scale: [100, 100]
    process :optimize
  end

  version :icon do
    process scale: [50, 50]
    process :optimize
  end

end
