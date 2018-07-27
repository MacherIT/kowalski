class AdquisicionesController < ApplicationController
  before_action :set_adquisicion, only: %i[show edit update destroy]
  before_action :set_empresa, only: %i[new]

  # GET /adquisiciones
  def index
    if params[:empresa_id].present? && (@empresa = Empresa.find(params[:empresa_id]))
      @adquisiciones = @empresa.adquisiciones
    else
      @adquisiciones = Adquisicion.all
    end
  end

  # GET /adquisiciones/1
  def show
  end

  # GET /adquisiciones/new
  def new
    @adquisicion = Adquisicion.new
  end

  # GET /adquisiciones/1/edit
  def edit
  end

  # POST /adquisiciones
  def create
    @adquisicion = Adquisicion.new(adquisicion_params)

    if @adquisicion.save
      redirect_to @adquisicion, notice: "Adquisición fue creada satisfactoriamente."
    else
      render :new
    end
  end

  # PATCH/PUT /adquisiciones/1
  def update
    if @adquisicion.update(adquisicion_params)
      redirect_to @adquisicion, notice: "Adquisición fue guardada satisfactoriamente."
    else
      render :edit
    end
  end

  # DELETE /adquisiciones/1
  def destroy
    @adquisicion.destroy
    redirect_to adquisiciones_url, notice: "Adquisición fue eliminada satisfactoriamente."
  end

  private

  # Si no esta seteada la empresa, redirige a root
  def set_empresa
    redirect_to(root_path) && return if params[:empresa_id].blank?
    @empresa = Empresa.find params[:empresa_id]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_adquisicion
    @adquisicion = Adquisicion.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def adquisicion_params
    params.require(:adquisicion).permit(:precio, :comentarios, :tipo_pago, :inicio, :fin, :empresa_id, :producto_id)
  end
end
