defmodule Cohere.Http do
  def post(endpoint, body, config \\ []) do
    endpoint
    |> url()
    |> Req.post(body: Jason.encode!(body), headers: headers(config[:api_key]))
    |> parse_response()
  end

  defp url(endpoint) do
    "https://api.cohere.ai/#{endpoint}"
  end

  defp headers(api_key) do
    api_key =
      if api_key do
        api_key
      else
        Cohere.Config.api_key()
      end

    [
      "Cohere-Version": "2022-12-06",
      accept: "application/json",
      "content-type": "application/json",
      authorization: "Bearer #{api_key}"
    ]
  end

  defp parse_response({:ok, %{status: status, body: body}}) when status in 200..299 do
    {:ok, body}
  end

  defp parse_response({:ok, %{body: body}}) do
    {:error, body}
  end

end
