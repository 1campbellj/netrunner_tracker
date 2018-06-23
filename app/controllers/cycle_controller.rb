class CycleController < ApplicationController
  before_action :find_cycle, except: [:index]

  def show
    @packs = @cycle.packs
  end

  def index
    @cycles = Cycle.includes(:packs).all
  end

  private

  def find_cycle
    @cycle = Cycle.find(params[:id])
  end



end
