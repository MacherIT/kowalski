# == Schema Information
#
# Table name: movimientos
#
#  concepto            :string
#  created_at          :datetime         not null
#  cuenta_credito_id   :bigint(8)
#  cuenta_credito_type :string
#  cuenta_debito_id    :bigint(8)
#  cuenta_debito_type  :string
#  fecha_efectiva      :date
#  fecha_supuesta      :date
#  hecha               :boolean
#  id                  :bigint(8)        not null, primary key
#  monto               :decimal(, )      default(0.0), not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_movimientos_on_cuenta_credito_type_and_cuenta_credito_id  (cuenta_credito_type,cuenta_credito_id)
#  index_movimientos_on_cuenta_debito_type_and_cuenta_debito_id    (cuenta_debito_type,cuenta_debito_id)
#

class MovimientosController < ApplicationController
  before_action :set_movimiento, only: %i[show edit update destroy]

  # GET /movimientos
  def index
    @movimientos = Movimiento.all
  end

  # GET /movimientos/1
  def show
  end

  # GET /movimientos/new
  def new
    @movimiento = Movimiento.new
  end

  # GET /movimientos/1/edit
  def edit
  end

  # POST /movimientos
  def create
    @movimiento = Movimiento.new(movimiento_params)

    if @movimiento.save
      redirect_to @movimiento, notice: 'Movimiento fue creado satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /movimientos/1
  def update
    if @movimiento.update(movimiento_params)
      redirect_to @movimiento, notice: 'Movimiento fue guardado satisfactoriamente.'
    else
      render :edit
    end
  end

  # DELETE /movimientos/1
  def destroy
    @movimiento.destroy
    redirect_to movimientos_url, notice: 'Movimiento fue eliminado satisfactoriamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movimiento
    @movimiento = Movimiento.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def movimiento_params
    params.require(:movimiento).permit(:cuenta_debito_id, :cuenta_credito_id, :concepto, :fecha_supuesta, :fecha_efectiva, :hecha)
  end
end
