# Renders the home page.
class HomeController < ApplicationController
  def index
    @movimientos = Movimiento.last 10
  end
end
