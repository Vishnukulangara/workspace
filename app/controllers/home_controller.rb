class HomeController < ApplicationController
	before_action :logged, only: :index

  def index

  end

  def password_change
  end

end
