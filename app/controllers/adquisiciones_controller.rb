# == Schema Information
#
# Table name: adquisiciones
#
#  comentarios :string
#  created_at  :datetime         not null
#  empresa_id  :bigint(8)        not null
#  fin         :date
#  id          :bigint(8)        not null, primary key
#  inicio      :date
#  precio      :decimal(, )      default(0.0), not null
#  producto_id :bigint(8)        not null
#  tipo_pago   :integer          default(0), not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_adquisiciones_on_empresa_id   (empresa_id)
#  index_adquisiciones_on_producto_id  (producto_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#  fk_rails_...  (producto_id => productos.id)
#

class AdquisicionesController < ApplicationController
  before_action :set_adquisicion, only: %i[show edit update destroy]
  before_action :set_empresa, only: %i[new]
  before_action :check_cuotas, only: %i[destroy]

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
    @adquisicion.empresa_id = params[:empresa_id]
  end

  # GET /adquisiciones/1/edit
  def edit
  end

  # POST /adquisiciones
  def create
    @adquisicion = Adquisicion.new(adquisicion_params)

    if @adquisicion.save
      crear_cuotas
      redirect_to @adquisicion, notice: "Adquisición fue creada satisfactoriamente."
    else
      render :new
    end
  end

  # PATCH/PUT /adquisiciones/1
  def update
    if @adquisicion.update(adquisicion_params)
      crear_cuotas
      redirect_to @adquisicion, notice: "Adquisición fue guardada satisfactoriamente."
    else
      render :edit
    end
  end

  # DELETE /adquisiciones/1
  def destroy
    @empresa = @adquisicion.empresa
    @adquisicion.destroy
    redirect_to empresa_adquisiciones_path(@empresa), notice: "Adquisición fue eliminada satisfactoriamente."
  end

  private

  # rubocop:disable AbcSize
  # rubocop:disable MethodLength
  # Crea las cuotas en funcion del tipo de pago
  def crear_cuotas
    case params[:adquisicion][:tipo_pago].to_s
    when TIPOS_PAGO[:unico].to_s
      @adquisicion.cuotas.destroy_all
      cuotas = params[:cant_cuotas]
      monto_cuota = @adquisicion.precio / cuotas.to_d
      cuotas.to_i.times do |i|
        @adquisicion.cuotas.create(monto: monto_cuota, concepto: "Cuota #{i}")
      end
    when TIPOS_PAGO[:recurrente].to_s
      @adquisicion.cuotas.destroy_all
      meses = params[:cant_meses]
      hoy = Time.zone.today
      dia = params[:dia_del_mes]
      mes = Time.zone.today.month
      ano = Time.zone.today.year
      fecha = Date.new(ano, mes, dia.to_i)
      hoy > fecha ? fecha += 1.month : nil
      meses.to_i.times do |i|
        @adquisicion.cuotas.create(concepto: "Cuota #{i + 1}", fecha_vencimiento: fecha, monto: params[:adquisicion][:precio])
        fecha += 1.month
        # mes += 1
      end
    end
    # params[:adquisicion].delete(:cuotas_attributes)
  end
  # rubocop:enable MethodLength
  # rubocop:enable AbcSize

  # No se podra detruir si tiene cuotas asociadas
  def check_cuotas
    return if @adquisicion.cuotas.none?
    flash[:alert] = "No se puede eliminar porque tiene cuotas asociadas. Puede darle una fecha de finalización a esta adquisición. Si realmente quiere borrarla, elimine primero las cuotas asociadas."
    redirect_to @adquisicion
  end

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
    params.require(:adquisicion).permit(:precio, :comentarios, :tipo_pago, :inicio, :fin, :empresa_id, :producto_id, cuotas_attributes: %i[id monto concepto fecha_vencimiento _destroy])
  end
end
