module HousingCacheView
  class Engine < ::Rails::Engine
    isolate_namespace HousingCacheView

    initializer "housing_cache_view.assets.precompile" do |app|
      app.config.assets.precompile += %w(resque_web/*.css)
    end
  end
end
