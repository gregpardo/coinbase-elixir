# Coinbase-Elixir

Coinbase API V1 Client for Elixir v0.1:

This is an unofficial alpha coinbase API client for the [Elixir](http://elixir-lang.org/) language. 

This API is based off of [balanced-elixir](https://github.com/bryanjos/balanced-elixir) and I take no credit for the organization of the project. 

**DISCLAIMER: Coinbase is an API for currency! This is not production ready yet and I take no responsibility for any damages.**

## Usage
Installation
```elixir
{:coinbase, "~> 0.0.1"}
```

[Documentation](http://hexdocs.pm/coinbase/)

```elixir
{:ok, coinbase} = Coinbase.new

#alternatively, you can pass in the key and secret

{:ok, coinbase} = Coinbase.new("my_key", "my_secret")

#then pass in the coinbase pid when calling functions

{status, response} = Coinbase.Users.Self.get(coinbase)

status is either `:ok` or `:error`
response is a Map converted from the json response from Coinbase.
```

## Additional Links
Coinbase API Documentation can be found [here](https://developers.coinbase.com/api/v1). Although I've found about 10-15 typos and things wrong with their examples. Be careful.

## Contributing
Please help this library. It's a great way to get some elixir experience. There is a decent amount of grunt work I don't have the time for.

Things to submit pull requests for:
- [ ] Complete tests for all endpoints
- [ ] Support new coinbase sandbox url 
- [ ] Use v2 of coinbase API
- [ ] Add appropriate licensing

