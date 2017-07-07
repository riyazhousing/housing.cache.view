module HousingCacheView
  class ApiController < ::HousingCacheView::ApplicationController
    def bla
      # http://www.java-samples.com/showtutorial.php?tutorialid=1090
      # require "base64"

      # enc   = Base64.encode64('Send reinforcements')
      #                     # -> "U2VuZCByZWluZm9yY2VtZW50cw==\n"
      # plain = Base64.decode64(enc)
      #                     # -> "Send reinforcements"
      render "housing_cache_view/home", :status => 200
    end
  end
end
