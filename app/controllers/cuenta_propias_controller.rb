class CuentaPropiasController < ApplicationController
  before_action :set_cuenta_propia, only: %i[show edit update destroy]

  # GET /cuentas_propias
  def index
    @cuentas_propias = CuentaPropia.all
  end

  # GET /cuentas_propias/1
  def show
  end

  # GET /cuentas_propias/new
  def new
    @cuenta_propia = CuentaPropia.new
  end

  # GET /cuentas_propias/1/edit
  def edit
  end

  # POST /cuentas_propias
  def create
    @cuenta_propia = CuentaPropia.new(cuenta_propia_params)

    if @cuenta_propia.save
      redirect_to @cuenta_propia, notice: 'Cuenta propia fue creada satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /cuentas_propias/1
  def update
    if @cuenta_propia.update(cuenta_propia_params)
      redirect_to @cuenta_propia, notice: 'Cuenta propia fue guardada satisfactoriamente.'
    else
      render :edit
    end
  end

  # DELETE /cuentas_propias/1
  def destroy
    @cuenta_propia.destroy
    redirect_to cuentas_propias_url, notice: 'Cuenta propia fue eliminada satisfactoriamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cuenta_propia
    @cuenta_propia = CuentaPropia.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cuenta_propia_params
    params.require(:cuenta_propia).permit(:dueno_id, :nombre)
  end
end
