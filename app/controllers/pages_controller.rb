class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:users]
  before_action :authenticate_admin!, only: [:admin]

  def home
  end

  def users
  end

  def admin
  end
end
