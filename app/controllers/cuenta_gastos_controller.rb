class CuentaGastosController < ApplicationController
  before_action :set_cuenta_gasto, only: %i[show edit update destroy]

  # GET /cuentas_gastos
  def index
    @cuentas_gastos = CuentaGasto.all
  end

  # GET /cuentas_gastos/1
  def show
  end

  # GET /cuentas_gastos/new
  def new
    @cuenta_gasto = CuentaGasto.new
  end

  # GET /cuentas_gastos/1/edit
  def edit
  end

  # POST /cuentas_gastos
  def create
    @cuenta_gasto = CuentaGasto.new(cuenta_gasto_params)

    if @cuenta_gasto.save
      redirect_to @cuenta_gasto, notice: 'Cuenta gasto fue creado satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /cuentas_gastos/1
  def update
    if @cuenta_gasto.update(cuenta_gasto_params)
      redirect_to @cuenta_gasto, notice: 'Cuenta gasto fue guardado satisfactoriamente.'
    else
      render :edit
    end
  end

  # DELETE /cuentas_gastos/1
  def destroy
    @cuenta_gasto.destroy
    redirect_to cuentas_gastos_url, notice: 'Cuenta gasto fue eliminado satisfactoriamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cuenta_gasto
    @cuenta_gasto = CuentaGasto.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cuenta_gasto_params
    params.require(:cuenta_gasto).permit(:concepto_gasto_id, :nombre)
  end
end
