get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
