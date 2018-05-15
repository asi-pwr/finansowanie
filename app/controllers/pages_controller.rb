# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    render 'page/home_page'
  end
end
