class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :picture

  attribute :like do |user|
    # user.likes.where(like: true).count
    posts = user.posts
    count = 0
    posts.each do |post|
      count += post.likes.where(like: true).count
    end
    count
  end

  attribute :dislike do |user|
    # user.likes.where(like: false).count
    posts = user.posts
    count = 0
    posts.each do |post|
      count += post.likes.where(like: false).count
    end
    count
  end
end
