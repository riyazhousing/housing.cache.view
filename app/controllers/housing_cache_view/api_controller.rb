module HousingCacheView
  class ApiController < ::HousingCacheView::ApplicationController
    require "base64"

    def bla
      parse_params_and_read_cache(params["p"])
      render "profiles/blabla", status: 200, layout: false
    end

    private
    def handle_cache_params params_hash
      if params_hash["rails_cache_key"].present?
        key = params_hash["rails_cache_key"]
        @values = Rails.cache.read(key)
      elsif params_hash["redis_cache_key"].present?
        redis = Redis.new(host: HousingConfig.redis_host, port: HousingConfig.redis_port, db: (params_hash["redis_cache_db"] || 1))
        key = params_hash["redis_namespace"].present? ? "#{params_hash["redis_namespace"]}:#{params_hash["redis_cache_key"]}" : params_hash["redis_cache_key"]
        switch_val = 1
        begin
          case switch_val
          when 1
            @values = redis.get(key)
          when 2
            @values = redis.smembers(key)
          when 3
            @values = redis.hgetall(key)
          end
        rescue Redis::CommandError => e
          switch_val = switch_val + 1
          retry if (switch_val <= 3)
          @error = "Redis Error: " + e.message
        end
      end
      @error = "No values found in cache for the provided key"
    end

    def parse_params_and_read_cache encoded_url
      if encoded_url.present?
        decoded_url = Base64.decode64(encoded_url)
        params = decoded_url.split(HousingCacheView::DELIMITER)
        salt = params.pop
        if (salt!=HousingCacheView::SALT)
          @error = "Permission Denied" 
        else
          fields = params.join('!!').split('&').compact
          params_hash = {}
          fields.each do |field|
            param_array = field.split('=')
            params_hash[param_array.shift] = param_array.join('')
          end
          handle_cache_params(params_hash)
        end
      end
    end

  end
end
