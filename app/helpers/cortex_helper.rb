module CortexHelper
  def cortex
    @cortex ||= Cortex::Client.new(key: Cortex::Blog::Client::Config.application_id, secret: Cortex::Blog::Client::Config.application_secret, base_url: Cortex::Blog::Client::Config.base_url)
  end
end