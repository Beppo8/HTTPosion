defmodule Poison do
  require Logger

  def login do
    response = generate_request_login()
    case HTTPoison.Response.(response) do
      true ->
        {:ok, Jason.decode!(response.body)}
      false ->
        Logger.info("inspect #{response.body}")
        {:error, "Error in request"}
    end
  end

  def generate_request_login do
    headers = ["Content-Type": "application/json",
              "Authorization": "Bearer",
              "ApiKey": "MTAyRkUwMzk3MDdEQ0EzRjE2NjFFOTBGNkE4QjJBRUY6N0JENkYxMkVFMjhBODA0NTJENDRFRUJFRjcxMTNENzNBNDI4QjJGMEI3MTI1RkI1"]
    body = invoice_body()
    HTTPoison.post(
      "http://167.250.76.163/wsCacaoParabilia/api/Login",
      body: Jason.encode(body),
      headers: headers,
      timeout: 50_000
    )
  end

  def invoice_body do
    %{
      "Password": "7BD6F12EE28A80452D44EEBEF7113D73A428B2F0B7125FB5",
      "NombreUsuario": "102FE039707DCA3F1661E90F6A8B2AEF"
    }
  end
end
