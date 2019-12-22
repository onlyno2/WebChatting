class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content

  attribute :like do |post|
    post.likes.where(like: true).count
  end

  attribute :dislike do |post|
    post.likes.where(like: false).count
  end

  attribute :name do |post|
    post.user.name
  end

  attribute :picture do |post|
    post.user.picture
  end

  belongs_to :user
end
