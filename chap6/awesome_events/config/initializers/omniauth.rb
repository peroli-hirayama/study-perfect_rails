# Set middleware config
Rails.application.config.middleware.use OmniAuth::Builder do
    # use twitter consumer key and consumer secret for OmniAuth
    provider :twitter,
        Rails.application.secrets.twitter_api_key,
        Rails.application.secrets.twitter_api_secret
end
