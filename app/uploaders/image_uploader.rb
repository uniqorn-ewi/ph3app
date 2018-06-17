class ImageUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    include CarrierWave::MiniMagick
    # Choose what kind of storage to use for this uploader:
    storage :file
  end

# process :tags => ['picture image']

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [240, 240]
  end

  def public_id
    return model.id
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def move_to_cache
    true
  end

  def move_to_store
    true
  end

  # ファイル名を日付にするとタイミングのせいでサムネイル名がずれる
  # ファイル名はランダムで一意になる
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
