module AzureADAuthenticate

  require 'yaml'
  Settings = YAML.load_file('settings.yml')

  # The Client ID is used by the application to uniquely identify itself to Azure AD.
  # The Tenant is the name of the Azure AD tenant in which this application is registered.
  # The AAD Instance is the instance of Azure, for example public Azure or Azure China.
  # The Redirect URI is the URI where Azure AD will return OAuth responses.
  # The Authority is the sign-in URL of the tenant.

  @aad_instance = 'xxx';
  @tenant = Settings['client_id'];
  @client_id = Settings['client_id'];
  @redirect_url = 'xxx';

  @todo_list_resource_id = 'xxx';
  @todo_list_base_address = 'xxx';

end