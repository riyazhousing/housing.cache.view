module HousingCacheView
  class ApiController < ::HousingCacheView::ApplicationController
    def bla
      render "housing_cache_view/cache_view_home", :status => 200
    end
  end
end