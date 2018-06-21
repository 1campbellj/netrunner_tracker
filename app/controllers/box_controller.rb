class BoxController < ApplicationController

  before_action :find_box

  def show
    @cards = @box.cards
  end

  private

  def find_box
    @box = Box.find(params[:id])
  end
end
