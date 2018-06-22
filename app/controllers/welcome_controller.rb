class WelcomeController < ApplicationController

  def index
    setup
  end

  def view_list
    ids = params[:ids].split(',')
    @cards = Card.where(id: ids)
  end

  def search
    setup
    @card_list = params[:card_list]
    card_q = @card_list.split("\r\n")
    num_to_add = 1
    card_q.each do |q|
      num_to_add = q.split(' ').first.to_i
      if num_to_add > 0
        q = q.split(' ')[1..-1].join(' ')
      end
      card = Card.where("cards.name LIKE '%#{q.gsub("'", '_')}%'").order(box_id: :desc).first if q.present?
      if card
        if num_to_add > 1
          num_to_add.times do
            @cards << card
          end
        else
          @cards << card
        end
      end
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
