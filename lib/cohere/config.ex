defmodule Cohere.Config do
  @moduledoc false

  def api_key(), do: Application.get_env(:cohere, :api_key)
end
