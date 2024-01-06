class MineSweepersController < ApplicationController
  before_action :set_mine_sweeper, only: %i[show edit destroy update]
  before_action :prepare_mine_sweeper, only: %i[create]

  def index
    @q = MineSweeper.ransack(name_eq: params.dig(:q, :name))
    @pagy, @mine_sweepers = pagy(@q.result.order(id: :desc))
  end

  def show; end

  def new
    @mine_sweeper = MineSweeper.new
  end

  def edit; end

  def create
    result, @mine_sweeper = ::MineSweepers::UpsertMineSweepersService.call(@mine_sweeper, mine_sweeper_params)

    if result
      redirect_to mine_sweeper_url(@mine_sweeper), notice: 'Mine sweeper was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result, @mine_sweeper = ::MineSweepers::UpsertMineSweepersService.call(@mine_sweeper, mine_sweeper_params)

    if result
      redirect_to mine_sweeper_url(@mine_sweeper), notice: 'Mine sweeper was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mine_sweeper.destroy!
    redirect_to mine_sweepers_url, notice: 'Mine sweeper was successfully destroyed.'
  end

  def view_all
    @mine_sweepers = MineSweeper.order(id: :desc)
  end

  private

  def prepare_mine_sweeper
    @mine_sweeper ||= MineSweeper.new(mine_sweeper_params)
  end

  def set_mine_sweeper
    @mine_sweeper ||= MineSweeper.find(params[:id])
  end

  def mine_sweeper_params
    params.require(:mine_sweeper).permit(
      :name,
      :email,
      :height,
      :width,
      :mines
    )
  end
end
