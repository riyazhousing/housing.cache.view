module HousingCacheView
  class Engine < ::Rails::Engine
    isolate_namespace HousingCacheView

    initializer "housing_cache_view.assets.precompile" do |app|
      app.config.assets.precompile += %w(housing_cache_view/*.css)
    end
  end
  module Plugins
    def self.plugins
      self.constants.map{|m| self.const_get(m)}
    end
  end
end