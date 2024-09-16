# frozen_string_literal: true

class Utilities

  def formatear_monto(numero)
    # Usa '%.2f' para asegurarte de que haya dos decimales y 'gsub' para agregar las comas
    formatted = '%.2f' % numero
    formatted.gsub(/(\d)(?=(\d{3})+\.)/, '\1,')
  end

end