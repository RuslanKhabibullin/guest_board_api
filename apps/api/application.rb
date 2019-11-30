require 'hanami/helpers'
require 'hanami/assets'

module Api
  class Application < Hanami::Application
    configure do
      root __dir__

      load_paths << %w[
        controllers
        validations
        presenters
      ]

      routes 'config/routes'

      default_request_format :json
      default_response_format :json

      middleware.prepend Rack::Cors do
        allow do
          origins ENV.fetch('FRONTEND_URL', '*')
          resource '*', headers: :any, methods: %i[get post put patch delete options head]
        end
      end
      middleware.use Warden::Manager do |manager|
        manager.default_strategies :jwt_strategy
        manager.failure_app = ::Api::Controllers::Unauthorized
      end

      security.x_frame_options 'DENY'
      security.x_content_type_options 'nosniff'
      security.x_xss_protection '1; mode=block'
      security.content_security_policy %{
        form-action 'self';
        frame-ancestors 'self';
        base-uri 'self';
        default-src 'none';
        script-src 'self';
        connect-src 'self';
        img-src 'self' https: data:;
        style-src 'self' 'unsafe-inline' https:;
        font-src 'self';
        object-src 'none';
        plugin-types application/pdf;
        child-src 'self';
        frame-src 'self';
        media-src 'self'
      }

      controller.prepare do
        include ::Api::Controllers::Defaults
        include ::Api::Controllers::Authentication
        include ::Api::Controllers::Authorization
      end
    end

    configure :development do
      handle_exceptions true
    end

    configure :test do
      handle_exceptions true
    end

    configure :production do
      scheme 'https'
      handle_exceptions true

      assets do
        compile false
        fingerprint true
        subresource_integrity :sha256
      end
    end
  end
end
