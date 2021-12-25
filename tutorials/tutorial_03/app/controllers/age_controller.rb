class AgeController < ApplicationController
  def generate_age
    unless params["birthdate"] == ""
      @day = (Date.today - Date.parse(params["birthdate"])).to_i
      if(@day >= 365)
        @year = @day / 365
        @day = @day % 365
      end
      render :show_age
    else
        render :show_age
    end
  end
end
