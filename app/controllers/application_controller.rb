class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  class << self
    
    Swagger::Docs::Generator::set_real_methods if defined?(request)
    def inherited(subclass)
      super
      subclass.class_eval do
        setup_basic_api_documentation
      end
    end

    private
    def setup_basic_api_documentation
      [:index, :show, :create, :update, :delete, :destroy].each do |api_action|
        swagger_api api_action do
          param :query, :app_key, :string, :optional, 'API Application (authentication) Key'
          param :query, :app_id, :string, :optional, 'API Application (authentication) ID'

        end rescue nil
      end
    end
  end

end
