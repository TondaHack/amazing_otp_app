defmodule AmazingOtpApp.Cache do
  use GenServer
  @name __MODULE__

  ## Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: @name])
  end

  def put(key, value, ttl \\ 10_000) do
    GenServer.cast(@name, {:put, key, value, ttl})
  end

  def get(key) do
    GenServer.call(@name, {:get, key})
  end

  # GenServer callbacks
  def init(_) do
    state = %{}
    {:ok, state}
  end

  def handle_cast({:put, key, value, ttl}, state) do
    Process.send_after(self(), {:expire, key}, ttl)
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_info({:expire, key}, state) do
    {:noreply, Map.delete(state, key)}
  end
end
