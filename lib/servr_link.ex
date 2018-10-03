defmodule ServrLink do
  use Tesla

  @default_base_url "https://go.servr.link/api/"
  @default_client Tesla.build_client([{Tesla.Middleware.BaseUrl, @default_base_url}])

  def is_uuid_registered?(client \\ @default_client, uuid) do
    case get(client, "/minecraft/isregistered?uuid=" <> uuid) do
      {:ok, res} -> do_is_registered(res.body)
      {:error, err} -> {:error, err}
    end
  end

  def is_discord_id_registered?(client \\ @default_client, discord_id) do
    case get(client, "/discord/isregistered?id=" <> discord_id) do
      {:ok, res} -> do_is_registered(res.body)
      {:error, err} -> {:error, err}
    end
  end

  def get_discord_id(client \\ @default_client, uuid) do
    case get(client, "/minecraft/getid?uuid=" <> uuid) do
      {:ok, res} -> do_get_discord_id(res.body)
      {:error, err} -> {:error, err}
    end
  end

  def get_uuid(client \\ @default_client, discord_id) do
    case get(client, "/discord/getuuid?id=" <> discord_id) do
      {:ok, res} -> do_get_uuid(res.body)
      {:error, err} -> {:error, err}
    end
  end

  def client(base_url) do
    Tesla.build_client([
      { Tesla.Middleware.BaseUrl, base_url }
    ])
  end

  defp do_is_registered(res_body) do
    body = Jason.decode!(res_body)
    if body["success"] do {:ok, body["registered"]} else {:error, :unsuccessful} end
  end

  defp do_get_discord_id(res_body) do
    body = Jason.decode!(res_body)
    if body["success"] do {:ok, body["id"]} else {:error, :unsuccessful} end
  end

  defp do_get_uuid(res_body) do
    body = Jason.decode!(res_body)
    if body["success"] do {:ok, body["uuid"]} else {:error, :unsuccessful} end
  end
end
