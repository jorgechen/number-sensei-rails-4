Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_PROVIDER_KEY'], ENV['GOOGLE_PROVIDER_SECRET']
end
