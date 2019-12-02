class ResponseHelper
  def self.error(message)
    { errors: message }
  end

  def self.success(message)
    { data: message }
  end
end
