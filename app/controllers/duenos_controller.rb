# == Schema Information
#
# Table name: duenos
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  nombre     :string
#  updated_at :datetime         not null
#

class DuenosController < ApplicationController
  before_action :set_dueno, only: %i[show edit update destroy]

  # GET /duenos
  def index
    @duenos = Dueno.all
  end

  # GET /duenos/1
  def show
  end

  # GET /duenos/new
  def new
    @dueno = Dueno.new
  end

  # GET /duenos/1/edit
  def edit
  end

  # POST /duenos
  def create
    @dueno = Dueno.new(dueno_params)

    if @dueno.save
      redirect_to @dueno, notice: 'Dueno was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /duenos/1
  def update
    if @dueno.update(dueno_params)
      redirect_to @dueno, notice: 'Dueno was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /duenos/1
  def destroy
    @dueno.destroy
    redirect_to duenos_url, notice: 'Dueno was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dueno
    @dueno = Dueno.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def dueno_params
    params.require(:dueno).permit(:nombre)
  end
end
