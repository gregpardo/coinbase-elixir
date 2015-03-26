ExUnit.start

defmodule CoinbaseSetupHelper do

  def coinbase_setup(cassette_name) do
    dir = "test/fixtures/#{cassette_name}"
    ExVCR.Config.cassette_library_dir(dir, dir)
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_SECRET")
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_KEY")
    HTTPoison.start
    fake_api_key = Application.get_env(:coinbase, :api_key, "api_key")
    fake_api_secret = Application.get_env(:coinbase, :api_secret, "api_secret")
    {:ok, coinbase } = Coinbase.new(fake_api_key, fake_api_secret)
    {:ok, [coinbase: coinbase] }
  end
end
