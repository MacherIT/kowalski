# == Schema Information
#
# Table name: servicios
#
#  comentarios :string
#  created_at  :datetime         not null
#  empresa_id  :bigint(8)        not null
#  fin         :date
#  id          :bigint(8)        not null, primary key
#  inicio      :date
#  precio      :decimal(, )      default(0.0), not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_servicios_on_empresa_id  (empresa_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#

class ServiciosController < ApplicationController
  before_action :set_servicio, only: %i[show edit update destroy]
  before_action :set_empresa, only: %i[new]

  # GET /servicios
  def index
    if params[:empresa_id].present? && (@empresa = Empresa.find(params[:empresa_id]))
      @servicios = @empresa.servicios
    else
      @servicios = Servicio.all
    end
  end

  # GET /servicios/1
  def show
  end

  # GET /servicios/new
  def new
    @servicio = Servicio.new
    @servicio.empresa_id = params[:empresa_id]
  end

  # GET /servicios/1/edit
  def edit
  end

  # POST /servicios
  def create
    @servicio = Servicio.new(servicio_params)

    if @servicio.save
      redirect_to @servicio, notice: 'Servicio fue creado satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /servicios/1
  def update
    if @servicio.update(servicio_params)
      redirect_to @servicio, notice: 'Servicio fue guardado satisfactoriamente.'
    else
      render :edit
    end
  end

  # DELETE /servicios/1
  def destroy
    @empresa = @servicio.empresa
    @servicio.destroy
    redirect_to empresa_servicios_url(@empresa), notice: 'Servicio fue eliminado satisfactoriamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_servicio
    @servicio = Servicio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def servicio_params
    params.require(:servicio).permit(:precio, :comentarios, :empresa_id, :inicio, :fin)
  end

  # Si no esta seteada la empresa, redirige a root
  def set_empresa
    redirect_to(root_path) && return if params[:empresa_id].blank?
    @empresa = Empresa.find params[:empresa_id]
  end
end
