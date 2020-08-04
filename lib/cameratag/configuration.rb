module Cameratag
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config) 
  end

  class Configuration
    attr_accessor :api_key, :app_id
  end
end