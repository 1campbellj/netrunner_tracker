class PackController < ApplicationController
  before_action :find_pack_and_cards

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

  def find_pack_and_cards
    @pack = Pack.find(params[:id])
    @cards = @pack.cards
  end
end
