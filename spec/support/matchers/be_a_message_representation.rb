RSpec::Matchers.define :be_a_message_representation do |message|
  match do |json|
    response_attributes = {
      'id' => message.id || kind_of(Integer),
      'content' => message.content,
      'created_at' => message.created_at ? message.created_at.to_s : kind_of(String),
      'user' => {
        'id' => message.user&.id || kind_of(Integer),
        'email' => message.user&.email || kind_of(String),
        'first_name' => message.user&.first_name || kind_of(String),
        'last_name' => message.user&.last_name || kind_of(String)
      }
    }

    expect(json).to be_present
    expect(json).to match response_attributes
  end
end
