class AvatarUploader < ImageUploader
  process :resize_to_limit => [150, 150]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end
end
