module AzureADAuthenticate


  # The Client ID is used by the application to uniquely identify itself to Azure AD.
  # The Tenant is the name of the Azure AD tenant in which this application is registered.
  # The AAD Instance is the instance of Azure, for example public Azure or Azure China.
  # The Redirect URI is the URI where Azure AD will return OAuth responses.
  # The Authority is the sign-in URL of the tenant.
  def self.load_settings
    require 'yaml'
    YAML.load_file('settings.yml')


    # @azure_ad_aad_instance = 'xxx';
    # @azure_ad_tenant = Settings['client_id'];
    # @azure_ad_client_id = Settings['client_id'];
    # @azure_ad_redirect_url = 'xxx';
    # @azure_ad_application_resource_id = 'xxx';
    # @azure_ad_application_base_address = 'xxx';

  end

  def self.get_login_page
    require 'net/http'
    settings = load_settings

    uri = URI(settings['aad_instance'] + settings['tenant'] + '/oauth2/authorize')

    params = {
      'resource'          => settings['application_resource_id'],
      'client_id'         => settings['client_id'],
      'response_type'     => 'code',
      'redirect_uri'      => settings['redirect_url'],
      # 'client-request-id' => ,
      'prompt'            => 'login'
    }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)

    puts response.body if response.is_a?(Net::HTTPSuccess)

  end

end