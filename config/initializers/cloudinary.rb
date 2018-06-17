if Rails.env.production?
  Cloudinary.config do |config|
    config.secure = true
    config.cdn_subdomain = false
    config.private_cdn = false
    config.enhance_image_tag = true
    config.static_image_support = true
  end
end

