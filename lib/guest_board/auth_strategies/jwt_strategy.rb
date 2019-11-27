class JWTStrategy < Warden::Strategies::Base
  def valid?
    request.env['Authorization'].present?
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
    strategy, token = request.env['Authorization'].split(' ')
    retun nil unless (strategy || '').casecmp('bearer')
    ::JWT::Wrapper.decode(token)
  end
end
