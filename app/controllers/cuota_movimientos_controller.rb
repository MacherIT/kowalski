class CuotaMovimientosController < MovimientosController
  def movimientos
    Cuota.find(params[:cuota_id]).movimientos.page(params[:page])
  end

  def index
    super
    @cuota = Cuota.find(params[:cuota_id])
    render "cuotas/movimientos/index"
  end
end
