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

  attribute :reaction do |post, params|
    reaction = params[:user].likes.find_by(post_id: post.id)
    if reaction.nil?
      nil
    else
      reaction.like
    end
  end

  belongs_to :user
end
