# == Schema Information
#
# Table name: empleados
#
#  apellido   :string
#  created_at :datetime         not null
#  cuit       :string
#  id         :bigint(8)        not null, primary key
#  nombre     :string
#  updated_at :datetime         not null
#

class EmpleadosController < ApplicationController
  before_action :set_empleado, only: %i[show edit update destroy]

  # GET /empleados
  def index
    @empleados = Empleado.all
  end

  # GET /empleados/1
  def show
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new
  end

  # GET /empleados/1/edit
  def edit
  end

  # POST /empleados
  def create
    @empleado = Empleado.new(empleado_params)

    if @empleado.save
      redirect_to @empleado, notice: 'Empleado was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /empleados/1
  def update
    if @empleado.update(empleado_params)
      redirect_to @empleado, notice: 'Empleado was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /empleados/1
  def destroy
    @empleado.destroy
    redirect_to empleados_url, notice: 'Empleado was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_empleado
    @empleado = Empleado.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def empleado_params
    params.require(:empleado).permit(:nombre, :apellido, :cuit)
  end
end
