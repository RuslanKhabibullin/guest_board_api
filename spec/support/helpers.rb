module Helpers
  def check_cors_response_headers
    expect(response_headers).to include(
      'Access-Control-Allow-Methods',
      'Access-Control-Allow-Origin',
      'Access-Control-Expose-Headers'
    )
  end
end
