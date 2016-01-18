Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1112623815449018', '1e4bc460c4491829b57c5084ee450c59'
end