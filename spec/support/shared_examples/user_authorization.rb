shared_examples 'entity authorization secured' do
  example_request 'Modify another user entity' do
    expect(response_status).to eq 403
    check_cors_response_headers
  end
end
