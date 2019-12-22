class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :picture

  attribute :like do |user|
    user.likes.where(like: true).count
  end

  attribute :dislike do |user|
    user.likes.where(like: false).count
  end
end
