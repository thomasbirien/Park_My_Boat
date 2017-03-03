class PagesController < ApplicationController
  layout 'home'
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
end
