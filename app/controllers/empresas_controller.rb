# == Schema Information
#
# Table name: empresas
#
#  created_at :datetime         not null
#  cuit_0     :integer          default(0)
#  cuit_1     :bigint(8)        default(0)
#  cuit_2     :integer          default(0)
#  id         :bigint(8)        not null, primary key
#  nombre     :string           not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_empresas_on_cuit_0  (cuit_0)
#  index_empresas_on_cuit_1  (cuit_1)
#  index_empresas_on_cuit_2  (cuit_2)
#  index_empresas_on_nombre  (nombre)
#

class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[show edit update destroy]

  # GET /empresas
  def index
    @empresas = Empresa.all
  end

  # GET /empresas/1
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  def create
    @empresa = Empresa.new(empresa_params)

    if @empresa.save
      redirect_to @empresa, notice: 'Empresa fue creado satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /empresas/1
  def update
    if @empresa.update(empresa_params)
      redirect_to @empresa, notice: 'Empresa fue guardado satisfactoriamente.'
    else
      render :edit
    end
  end

  # DELETE /empresas/1
  def destroy
    @empresa.destroy
    redirect_to empresas_url, notice: 'Empresa fue eliminado satisfactoriamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_empresa
    @empresa = Empresa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def empresa_params
    params.require(:empresa).permit(:nombre, :cuit_0, :cuit_1, :cuit_2)
  end
end
