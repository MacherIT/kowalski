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
      crear_cuotas
      redirect_to @servicio, notice: 'Servicio fue creado satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /servicios/1
  def update
    if @servicio.update(servicio_params)
      crear_cuotas
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

  # rubocop:disable AbcSize
  # rubocop:disable MethodLength
  def crear_cuotas
    @servicio.cuotas.destroy_all
    hoy = Time.zone.today
    dia = params[:dia_del_mes]
    mes = Time.zone.today.month
    ano = Time.zone.today.year
    fecha = Date.new(ano, mes, dia.to_i)
    hoy > fecha ? fecha += 1.month : nil
    @servicio.fin = @servicio.inicio + 1.year if @servicio.fin.blank?
    i = 0
    while fecha < @servicio.fin
      i += 1
      @servicio.cuotas.create(concepto: "Cuota #{i + 1}", fecha_vencimiento: fecha, monto: params[:servicio][:precio])
      fecha += 1.month
      # params[:servicio].delete(:cuotas_attributes)
    end
  end
  # rubocop:enable AbcSize
  # rubocop:enable MethodLength

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
