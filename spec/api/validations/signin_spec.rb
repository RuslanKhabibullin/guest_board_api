describe Api::Validations::Signin do
  subject(:validator) { described_class.new(params).validate }

  it_behaves_like 'a user attributes validator'
end
