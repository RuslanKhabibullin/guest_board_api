require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/guest_board'
require_relative '../apps/api/application'

Hanami.configure do
  mount Api::Application, at: '/api'

  model do
    adapter :sql, ENV.fetch('DATABASE_URL')

    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  environment :development do
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []
  end
end
