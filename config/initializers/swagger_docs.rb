class Swagger::Docs::Config
  def self.base_api_controller; ApplicationController end
  def self.transform_path(path, api_version)
    "/apidocs/#{path}"
  end
end

Swagger::Docs::Config.register_apis({
  "1.0" => {
    # the extension used for the API
    :api_extension_type => nil,
    :camelize_model_properties => false,
    # the output location where your .json files are written to
    :api_file_path => "public/apidocs",
    # the URL base path to your API
    :base_path => Rails.env.production? ? "http://stormy-reaches-5136.herokuapp.com" : "http://localhost:3000",
    # if you want to delete all .json files at each generation
    :clean_directory => true
  }
})