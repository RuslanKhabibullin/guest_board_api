shared_examples 'auth secured endpoint' do
  example_request 'Get user data without token' do
    expect(response_status).to eq 401
    check_cors_response_headers
  end
end
