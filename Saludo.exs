defmodule Saludo do
  def saludar do
    # 1. Pedir el nombre
    IO.write("Ingrese su nombre: ")
    nombre = String.trim(IO.gets(""))

    # 2. Obtener fecha y hora del sistema
    {{_anio, _mes, _dia}, {hora, _minuto, _segundo}} = :calendar.local_time()

    # 3. Decidir el saludo según la hora
    mensaje =
      cond do
        hora >= 0 and hora <= 11 -> "Buenos días"
        hora >= 12 and hora <= 17 -> "Buenas tardes"
        true -> "Buenas noches"
      end

    # 4. Mostrar el saludo final
    IO.puts("#{mensaje} #{nombre}")
  end
end
Saludo.saludar()
