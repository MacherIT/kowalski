class ConceptoGastosController < ApplicationController
  before_action :set_concepto_gasto, only: %i[show edit update destroy]

  # GET /conceptos_gastos
  def index
    @conceptos_gastos = ConceptoGasto.all
  end

  # GET /conceptos_gastos/1
  def show
  end

  # GET /conceptos_gastos/new
  def new
    @concepto_gasto = ConceptoGasto.new
  end

  # GET /conceptos_gastos/1/edit
  def edit
  end

  # POST /conceptos_gastos
  def create
    @concepto_gasto = ConceptoGasto.new(concepto_gasto_params)

    if @concepto_gasto.save
      redirect_to @concepto_gasto, notice: 'Concepto gasto fue creado satisfactoriamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /conceptos_gastos/1
  def update
    if @concepto_gasto.update(concepto_gasto_params)
      redirect_to @concepto_gasto, notice: 'Concepto gasto fue guardado satisfactoriamente.'
    else
      render :edit
    end
  end

  # DELETE /conceptos_gastos/1
  def destroy
    @concepto_gasto.destroy
    redirect_to conceptos_gastos_url, notice: 'Concepto gasto fue eliminado satisfactoriamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_concepto_gasto
    @concepto_gasto = ConceptoGasto.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def concepto_gasto_params
    params.require(:concepto_gasto).permit(:nombre)
  end
end
