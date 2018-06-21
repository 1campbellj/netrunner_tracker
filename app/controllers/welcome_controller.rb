class WelcomeController < ApplicationController

  def index
    setup
  end

  def search
    setup
    @card_list = params[:card_list]
    card_q = @card_list.split("\r\n")
    card_q.each do |q|
      card = Card.where("cards.name LIKE '%#{q}%'").first if q.present?
      @cards << card if card
    end

    render 'index'
  end

  private

  def setup
    @cycles = Cycle.all
    @boxes = Box.all
    @cards = []
  end
end
