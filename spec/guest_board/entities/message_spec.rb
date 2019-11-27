describe Message, type: :entity do
  let(:message_attributes) { { user_id: 1, content: 'Hello' } }

  it 'can be initialized with user and content' do
    message = described_class.new(message_attributes)
    expect(message.user_id).to eq 1
    expect(message.content).to eq 'Hello'
  end
end
