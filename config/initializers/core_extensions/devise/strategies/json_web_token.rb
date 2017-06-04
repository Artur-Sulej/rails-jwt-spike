module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers['Authorization'].present?
      end

      def authenticate!
        decoded_token = claims
        return fail! unless decoded_token
        return fail! unless decoded_token.has_key?('user_id')
        success! User.find_by(id: decoded_token['user_id'])
      end

      protected

      def claims
        strategy, token = request.headers['Authorization'].split(' ')
        return nil if (strategy || '').downcase != 'bearer'
        JWTWrapper.decode(token) rescue nil
      end
    end
  end
end
