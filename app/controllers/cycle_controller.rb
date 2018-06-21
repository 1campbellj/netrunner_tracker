class CycleController < ApplicationController
  before_action :find_cycle

  def show
    @packs = @cycle.packs
  end

  private

  def find_cycle
    @cycle = Cycle.find(params[:id])
  end



end
