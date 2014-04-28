class NumberToHumanizeController < ApplicationController

  def show
    @output = params[:number].to_i.humanize
  end

end
