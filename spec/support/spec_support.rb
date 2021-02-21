module SpecSupport
    def current_user
        @current_user
      end
      RSpec.configure do |config|
        config.include SpecSupport
      end
end
