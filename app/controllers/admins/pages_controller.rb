class Admins::PagesController < ApplicationController
  before_action :authenticate_admin!

  def home
  end

  def about
  end
end
