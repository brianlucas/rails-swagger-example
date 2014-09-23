class MonstersController < ApplicationController
  include Swagger::Docs::ImpotentMethods
  swagger_controller :monsters, "The Monsters."

  respond_to :json
  
  swagger_api :index do
    summary "Fetches all monsters"
    notes "This lists all the active monsters"
    response :not_acceptable
  end
    
  def index
    @monsters = Monster.all
    respond_with @monsters
  end
  
  # swagger_api :create do
  #   summary "Creates a new Monster"
  #   param :form, :first_name, :string, :required, "First name"
  #   param :form, :last_name, :string, :required, "Last name"
  #   param :form, :email, :string, :required, "Email address"
  #   param_list :form, :role, :string, :required, "Role", [ "admin", "superadmin", "user" ]
  #   param_list :form, :color, :string, :required, "Color", [ "blue", "green", "yellow", "red" ]
  #   param :body, :body, :Monster, :optional, "JSON object"
  #
  #   response :unauthorized
  #   response :not_acceptable
  # end
  
  swagger_api :create do
    summary "Creates a new Monster"
    param :form, :first_name, :string, :optional, "First name"
    param :form, :last_name, :string, :optional, "Last name"
    param :form, :email, :string, :optional, "Email address"
    param_list :form, :role, :string, :optional, "Role", [ "admin", "superadmin", "user" ]
    param_list :form, :color, :string, :optional, "Color", [ "blue", "green", "yellow", "red" ]
    param :body, :body, :Monster, :optional, "JSON object"
    response :unprocessable_entity
    response :unauthorized
    response :not_acceptable
  end
  
  # Support for Swagger complex types:
  # https://github.com/wordnik/swagger-core/wiki/Datatypes#wiki-complex-types
   swagger_model :Monster do
     description "A Monster object."
     property :first_name, :string, :optional, "First Name"
     property :last_name, :string, :optional, "Last Name"
     property :email, :string, :optional, "Email Address"
     property :role, :enum, :optional, [ "admin", "superadmin", "user" ]
     property :color, :enum, :optional, [ "blue", "green", "yellow", "red" ]
   end
  
  def create
    @monster = Monster.create(filtered_params)
    respond_with @monster
  end
  
  
  swagger_api :show do
    summary "Fetches a single Monster item"
    param :path, :id, :integer, :required, "User Id"
    response :success, "Success", :Monster
    response :unauthorized
    response :not_found
  end
  
  def show
    @monster = Monster.find(filtered_params[:id])
    respond_with @monster
  end
  
  swagger_api :update do
    summary "Updates an existing Monster"
    param :path, :id, :integer, :required, "Monster Id"
    param :form, :first_name, :string, :optional, "First name"
    param :form, :last_name, :string, :optional, "Last name"
    param :form, :email, :string, :optional, "Email address"
    param_list :form, :role, :string, :optional, "Role", [ "admin", "superadmin", "user" ]
    param_list :form, :color, :string, :optional, "Color", [ "blue", "green", "yellow", "red" ]
    response :unprocessable_entity
    response :unauthorized
    response :not_found

  end

  def update
    @monster = Monster.find(filtered_params[:id])
    @monster.update(filtered_params)
    puts @monster.to_json
    respond_with @monster.to_json
  end

  swagger_api :destroy do
    summary "Deletes an existing Monster item"
    param :path, :id, :integer, :required, "Monster Id"
    response :unauthorized
    response :unprocessable_entity
    response :not_found
  end
  
  def destroy
    @monster = Monster.destroy(filtered_params[:id])
    respond_with @monster
  end
  
  swagger_api :show_cookies do
    summary "Shows cookies attached to a Monster"
    param :query, :app_key, :string, :optional, 'API Application (authentication) Key'
    param :query, :app_id, :string, :optional, 'API Application (authentication) ID'
    param :path, :id, :integer, :required, "Monster Id"
    response :unauthorized
    response :unprocessable_entity
    response :not_found
  end
  
  def show_cookies
    @monster = Monster.find(filtered_params[:id])
    respond_with @monster.cookies
  end

  private

  def filtered_params
    params.permit(:id, :first_name, :last_name, :email, :role, :color)
  end
  
  
end
