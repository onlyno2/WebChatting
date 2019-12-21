class UploadHelper
  @options = {
    cloud_name: 'dekj6ujzr',
    api_key: '165126113252299',
    api_secret: 'LB7VWvm7JYjCu9d2a6SWWIaC3q4',
    width: 50,
    height: 50,
    crop: :limit
  }

  def self.upload(src)
    Cloudinary::Uploader.upload(src, @options)
  end
end
