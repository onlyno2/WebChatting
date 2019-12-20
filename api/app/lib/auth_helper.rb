require 'koala'

class AuthHelper
  def self.current_user(token)
    id = JsonWebToken.decode(token)['payload']
    User.find_by(id: id)
  end

  class FacebookLogin
    def self.user_info(access_token)
      graph = Koala::Facebook::API.new(access_token)
      graph.get_object('me?fields=id,name,email,picture{url}')
    end
  end
end
