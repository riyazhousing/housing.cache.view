module HousingCacheView
  class ApiController < ApplicationController
    def bla
      render json: {"message" => "Thu"}, status: 200
    end
  end
end