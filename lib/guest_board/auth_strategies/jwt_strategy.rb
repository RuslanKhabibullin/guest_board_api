class JWTStrategy < Warden::Strategies::Base
  def valid?
    request.env['HTTP_AUTHORIZATION'].present?
  end

  def authenticate!
    return fail! unless claims&.key? :sub

    user = UserRepository.new.find(claims[:sub])

    user ? success!(user) : fail!
  rescue JWT::ExpiredSignature
    fail!(:token_expired)
  rescue JWT::VerificationError, JWT::DecodeError
    fail!
  end

  private

  def claims
    strategy, token = request.env['HTTP_AUTHORIZATION'].split(' ')
    retun nil unless (strategy || '').casecmp('bearer')
    ::JWT::Wrapper.decode(token).symbolize_keys
  end
end
