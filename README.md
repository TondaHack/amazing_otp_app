# AmazingOtpApp

## Send & receive message 
Open iex by `iex -S mix` and copy/paste next lines

```elixir
receiving_process_pid = spawn fn ->
  receive do
    {:message, msg} -> IO.puts msg
  end
end
```

Check if the process is alive
```elixir
Process.alive? receiving_process_pid
# true
```

```elixir
send(receiving_process_pid, {:message, "Hello World"})
# Hello World
```
Now, You sent the first message to the process that is waiting for it.

```elixir
Process.alive? receiving_process_pid
# false
```

## Genserver

Open iex by `iex -S mix` and copy/paste next lines

```elixir
AmazingOtpApp.Cache.put :my_amazing_cache, %{cached_data: "very important value"}, 10_000
# :ok

AmazingOtpApp.Cache.get :my_amazing_cache
# %{cached_data: "very important value"}


# Wait 10 seconds
AmazingOtpApp.Cache.get :my_amazing_cache
# nil
```


