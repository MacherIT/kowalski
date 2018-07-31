# == Schema Information
#
# Table name: cuotas
#
#  adquisicion_id    :bigint(8)
#  concepto          :string           default("Cuota unica"), not null
#  created_at        :datetime         not null
#  fecha_vencimiento :date
#  id                :bigint(8)        not null, primary key
#  monto             :decimal(, )      default(0.0), not null
#  pagada            :boolean          default(FALSE)
#  servicio_id       :bigint(8)
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_cuotas_on_adquisicion_id  (adquisicion_id)
#  index_cuotas_on_servicio_id     (servicio_id)
#
# Foreign Keys
#
#  fk_rails_...  (adquisicion_id => adquisiciones.id)
#  fk_rails_...  (servicio_id => servicios.id)
#

class CuotasController < ApplicationController
  before_action :set_cuota, only: %i[show edit update destroy]

  # GET /cuotas
  def index
    @cuotas = Cuota.page(params[:page]).per(20)
  end

  # GET /cuotas/1
  def show
  end

  # GET /cuotas/new
  def new
    @cuota = Cuota.new
  end

  # GET /cuotas/1/edit
  def edit
  end

  # POST /cuotas
  def create
    @cuota = Cuota.new(cuota_params)

    if @cuota.save
      redirect_to @cuota, notice: 'Cuota fue creada satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /cuotas/1
  def update
    if @cuota.update(cuota_params)
      redirect_to @cuota, notice: 'Cuota fue guardads satisfactoriamente.'
    else
      render :edit
    end
  end

  # DELETE /cuotas/1
  def destroy
    @adquisicion = @cuota.adquisicion
    @cuota.destroy
    redirect_back fallback_location: @adquisicion, notice: 'Cuota fue eliminads satisfactoriamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cuota
    @cuota = Cuota.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cuota_params
    params.require(:cuota).permit(:adquisicion_id, :monto, :fecha_vencimiento, :concepto)
  end
end
