class BoxController < ApplicationController

  before_action :find_box

  def show
  end

  def own_all
    @cards.update_all(owned: true)
  end

  def proxy_all
    @cards.update_all(proxied: true)
  end

  def disown_all
    @cards.update_all(owned: false)
  end

  def unproxy_all
    @cards.update_all(proxied: false)
  end

  private

  def find_box
    @box = Box.includes(:cards).find(params[:id])
    @cards = @box.cards
  end
end
