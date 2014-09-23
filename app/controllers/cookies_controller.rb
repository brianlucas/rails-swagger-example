class CookiesController < ApplicationController
    include Swagger::Docs::ImpotentMethods
    
    respond_to :json
    
    swagger_controller :cookies, "The Cookies."
  
    swagger_api :index do
      summary "Fetches all Cookies"
      notes "This lists all the active cookies"
      response :not_acceptable
    end

    def index
      @cookies = Cookie.all
      respond_with @cookies
    end

    swagger_api :show do
      summary "Fetches a single Cookie item"
      param :path, :id, :integer, :required, "Cookie Id"
      response :success, "Success", :Monster
      response :unauthorized
      response :not_acceptable
      response :not_found
    end
  
    def show
      @cookie = Cookie.find(filtered_params[:id])
      respond_with @cookie
    end

    swagger_api :create do
      summary "Creates a new Cookie"
      param_list :form, :cookie_type, :string, :optional, "Cookie Type", [ "Oatmeal", "Chocolate Chip", "Animal Cracker" ]
      param :form, :gluten_free, :boolean, :optional, "Gluten Free"
      param :form, :price, :float, :optional, "Price"
      param :form, :monster_id, :Monster, :optional, "Monster ID to associate this cookie with"
      param :body, :body, :Cookie, :optional, "JSON object"
      response :unauthorized
      response :not_acceptable
    end
    # Support for Swagger complex types:
    # https://github.com/wordnik/swagger-core/wiki/Datatypes#wiki-complex-types
    swagger_model :Cookie do
      description "A Cookie object."
      property :cookie_type, :string, :optional, [ "Oatmeal", "Chocolate Chip", "Animal Cracker" ]
      property :gluten_free, :boolean, :optional, "Gluten Free"
      property :price, :float, :optional, "Price"
      property :monster_id, :integer, :optional, "Email Address"
    end
  
  
    def create
      @cookie = Cookie.create(filtered_params)
      respond_with @cookie
    end

  
    swagger_api :update do
      summary "Updates an existing Cookie"
      param_list :form, :cookie_type, :string, :required, "Cookie Type", [ "Oatmeal", "Chocolate Chip", "Animal Cracker" ]
      param :form, :gluten_free, :boolean, :optional, "Gluten Free"
      param :form, :price, :float, :optional, "Price"
      param :form, :monster_id, :integer, :optional, "A Monster ID (user_id) to associate this cookie with"
      
      response :unauthorized
      response :not_found
      response :not_acceptable
    end
    
    def update
      @cookie = Cookie.find(filtered_params[:id])
      @cookie.update(filtered_params)
      respond_with @cookie
    end

    swagger_api :destroy do
      summary "Deletes an existing Cookie"
      param  :path, :id, :integer, :required, "Cookie Id"
      response :unauthorized
      response :not_found
      response :not_acceptable
    end
    
    def destroy
      @cookie = Cookie.find(filtered_params[:id])
      @cookie.destroy
      respond_with @cookie
    end


    private

    def filtered_params
      params.permit(:id, :cookie_type, :gluten_free, :monster_id, :price)
    end
    
end
