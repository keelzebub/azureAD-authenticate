azureAD-authenticate
===================

This ruby module will provide functionality to call web APIs secured using Azure AD.

In short, it will get a JWT access token through the OAuth 2.0 protocol using the Active Directory Authentication Library (ADAL). That token can be sent to the API in order to authenticate the user.