class IdentitiesController < ApplicationController

  def new
    @identity = env['omniauth.identity'] || Identity.new
  end

end
