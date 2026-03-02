defmodule ValidadorUsuario do
  def validar(usuario) do
    errores =
      []
      |> validar_longitud(usuario)
      |> validar_minusculas(usuario)
      |> validar_espacios(usuario)
      |> validar_especiales(usuario)
      |> validar_letras(usuario)

    if errores == [] do
      {:ok, "Usuario válido"}
    else
      {:error, errores}
    end
  end

  def validar_longitud(errores, usuario) do
    longitud = String.length(usuario)

    if longitud < 5 or longitud > 12 do
      errores ++ ["Debe tener entre 5 y 12 caracteres"]
    else
      errores
    end
  end

  def validar_minusculas(errores, usuario) do
    if usuario == String.downcase(usuario) do
      errores
    else
      errores ++ ["Debe estar en minúsculas"]
    end
  end

  def validar_espacios(errores, usuario) do
    if String.contains?(usuario, " ") do
      errores ++ ["No debe contener espacios"]
    else
      errores
    end
  end

  def validar_especiales(errores, usuario) do
    if String.contains?(usuario, ["@", "#", "$", "%"]) do
      errores ++ ["No debe contener caracteres especiales"]
    else
      errores
    end
  end

  def validar_letras(errores, usuario) do
    letras = "abcdefghijklmnopqrstuvwxyz"

    if String.contains?(usuario, String.split(letras, "")) do
      errores
    else
      errores ++ ["Debe contener al menos una letra"]
    end
  end
end
