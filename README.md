# ServrLink Elixir API

## Introduction
This is the Elixir API wrapper for [ServrLink](https://servr.link/)

## Examples
```elixir
{:ok, is_uuid_registered} = ServrLink.is_uuid_registered? "uuid"
{:ok, is_discord_id_registered} = ServrLink.is_discord_id_registered? 12345
{:ok, uuid} = ServrLink.get_uuid 12345
{:ok, discord_id} = ServrLink.get_discord_id "uuid"
```

The API can also be used with a custom endpoint
```elixir
client = ServrLink.client("https://my-custom.endpoint/")
{:ok, is_uuid_registered} = client |> ServrLink.is_uuid_registered? "uuid"
{:ok, is_discord_id_registered} = client |> ServrLink.is_discord_id_registered? 12345
{:ok, uuid} = client |> ServrLink.get_uuid 12345
{:ok, discord_id} = client |> ServrLink.get_discord_id "uuid"
```
