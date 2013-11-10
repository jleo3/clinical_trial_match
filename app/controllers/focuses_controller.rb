class FocusesController < ApplicationController
  def show
  	@focuses = Focus.all
  end
end
