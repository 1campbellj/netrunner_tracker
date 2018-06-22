class CardController < ApplicationController
  before_action :find_card, except: [:own_all, :proxy_all, :disown_all, :unproxy_all]

  def own_all
    Card.where(id: params['card_ids']).update_all(owned: true)
    render json: {}, status: :ok
  end

  def disown_all
    Card.where(id: params['card_ids']).update_all(owned: false)
    render json: {}, status: :ok
  end

  def proxy_all
    Card.where(id: params['card_ids']).update_all(proxied: true)
    render json: {}, status: :ok
  end

  def unproxy_all
    Card.where(id: params['card_ids']).update_all(proxied: false)
    render json: {}, status: :ok
  end

  def own
    if @card.update_attribute(:owned, true)
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def disown
    if @card.update_attribute(:owned, false)
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def proxy
    if @card.update_attribute(:proxied, true)
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def unproxy
    if @card.update_attribute(:proxied, false)
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end


  private

  def find_card
    @card = Card.find(params[:id])
  end
end
