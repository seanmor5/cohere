defmodule Cohere do

  import Cohere.Http

  @doc """
  Embeds the given text or texts.
  """
  def embed(texts, opts \\ []) do
    opts = Keyword.validate!(opts, [:config, truncate: "END", model: "small"])
    post("embed", %{"texts" => List.wrap(texts), "truncate" => opts[:truncate]}, opts[:config])
  end
end
