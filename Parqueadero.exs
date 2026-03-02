defmodule Parqueadero do
  def calcular do

    IO.write("Horas de permanencia: ")
    horas = String.to_integer(String.trim(IO.gets("")))

    IO.write("Tipo de cliente (1=frecuente, 2=regular): ")
    cliente = String.to_integer(String.trim(IO.gets("")))

    IO.write("Tipo de vehículo (1=eléctrico, 2=convencional): ")
    vehiculo = String.to_integer(String.trim(IO.gets("")))

    IO.write("Día (1=fin de semana, 2=entre semana): ")
    dia = String.to_integer(String.trim(IO.gets("")))

    tarifa_base =
      cond do
        horas <= 2 -> 3000
        horas <= 5 -> 3000 + (horas - 2) * 2500
        horas <= 8 -> 3000 + 3 * 2500 + (horas - 5) * 2000
        true -> 18000
      end

    descuento = 0

    descuento =
      if cliente == 1 do
        descuento + 0.15
      else
        descuento
      end

    descuento =
      if vehiculo == 1 do
        descuento + 0.20
      else
        descuento
      end

    descuento =
      if dia == 1 do
        descuento + 0.10
      else
        descuento
      end

    total = tarifa_base * (1 - descuento)

    IO.puts("Tarifa base: $#{tarifa_base}")
    IO.puts("Descuento aplicado: #{descuento * 100}%")
    IO.puts("Total a pagar: $#{total}")
  end
end
Parqueadero.calcular()
