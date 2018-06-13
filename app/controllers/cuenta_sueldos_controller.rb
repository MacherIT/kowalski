class CuentaSueldosController < ApplicationController
  before_action :set_cuenta_sueldo, only: %i[show edit update destroy]

  # GET /cuentas_sueldos
  def index
    @cuentas_sueldos = CuentaSueldo.all
  end

  # GET /cuentas_sueldos/1
  def show
  end

  # GET /cuentas_sueldos/new
  def new
    @cuenta_sueldo = CuentaSueldo.new
  end

  # GET /cuentas_sueldos/1/edit
  def edit
  end

  # POST /cuentas_sueldos
  def create
    @cuenta_sueldo = CuentaSueldo.new(cuenta_sueldo_params)

    if @cuenta_sueldo.save
      redirect_to @cuenta_sueldo, notice: 'Cuenta sueldo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cuentas_sueldos/1
  def update
    if @cuenta_sueldo.update(cuenta_sueldo_params)
      redirect_to @cuenta_sueldo, notice: 'Cuenta sueldo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cuentas_sueldos/1
  def destroy
    @cuenta_sueldo.destroy
    redirect_to cuentas_sueldos_url, notice: 'Cuenta sueldo was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cuenta_sueldo
    @cuenta_sueldo = CuentaSueldo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cuenta_sueldo_params
    params.require(:cuenta_sueldo).permit(:empleado_id, :nombre)
  end
end
