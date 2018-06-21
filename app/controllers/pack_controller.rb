class PackController < ApplicationController
  before_action :find_pack

  def show
    @cards = @pack.cards
  end

  private

  def find_pack
    @pack = Pack.find(params[:id])
  end
end
