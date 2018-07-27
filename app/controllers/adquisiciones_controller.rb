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
    redirect_to adquisiciones_url, notice: "Adquisición fue eliminada satisfactoriamente."
  end

  private

  # rubocop:disable AbcSize
  # rubocop:disable MethodLength
  # Crea las cuotas en funcion del tipo de pago
  def crear_cuotas
    case params[:adquisicion][:tipo_pago].to_s
    when TIPOS_PAGO[:unico].to_s
      cuotas = params[:cant_cuotas]
      (cuotas.to_i - @adquisicion.cuotas.count).times do
        @adquisicion.cuotas.create
      end
    when TIPOS_PAGO[:recurrente].to_s
      meses = params[:cant_meses]
      dia = params[:dia_del_mes]
      hoy = Time.zone.today.day
      mes = Time.zone.today.month
      ano = Time.zone.today.year
      hoy.to_s > dia ? mes += 1 : nil
      @adquisicion.cuotas.destroy_all
      meses.to_i.times do |i|
        fecha = Date.new(ano, mes, dia.to_i)
        @adquisicion.cuotas.create(concepto: "Cuota #{i + 1}", fecha_vencimiento: fecha, monto: params[:adquisicion][:precio])
        mes += 1
      end
    end
    # params[:adquisicion].delete(:cuotas_attributes)
  end
  # rubocop:enable MethodLength
  # rubocop:enable AbcSize

  # No se podra detruir si tiene cuotas asociadas
  def check_cuotas
    redirect_to @adquisicion unless @adquisicion.cuotas.none?
    flash[:alert] = "No se puede eliminar porque tiene cuotas asociadas. Puede darle una fecha de finalización a esta adquisición. Si realmente quiere borrarla, elimine primero las cuotas asociadas."
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
