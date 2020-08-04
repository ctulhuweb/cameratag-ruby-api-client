require 'cameratag/configuration'

module Cameratag
  class << self

    def videos
      assets({type: "video"})
    end

    def audios
      assets({type: "audio"})
    end

    def photos
      assets({type: "photo"})
    end

    def assets(**params)
      get("apps/#{config.app_id}/assets", "assets", params)
    end

    def apps(**params)
      get("apps", "cameras", params)
    end

    def get(rest_path, response_array_key, **params)
      url = "#{full_path}/#{rest_path}.json"
      uri = URI(url)
      uri.query = URI.encode_www_form(params.merge({api_key: config.api_key}))
      res = Net::HTTP.get_response(uri)
      apps = JSON.parse(res.body)[response_array_key]
    end

    def full_path
      "https://cameratag.com/api/v13"
    end
  end
end