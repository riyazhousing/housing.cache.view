module HousingCacheView
  class CacheViewController < HousingCacheView::ApplicationController
    def bla
      render json: {"message" => "Thu"}, status: 200
    end
  end
end