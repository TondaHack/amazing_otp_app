# AmazingOtpApp

This repository consists reference code for the talk: Concurrency v Elixiru aneb proč OTP zachránilo telekomunikace ([YouTube link](https://www.youtube.com/live/xUqmubawp54?feature=share&t=4261))


presented for: [Tech Meetup Ostrava](https://www.meetup.com/techmeetupostrava/events/290746768/) in the Czech language

## Install Elixir
- https://elixir-lang.org/install.html
- clone this repo `git clone git@github.com:TondaHack/amazing_otp_app.git`
- open comand line in the repo folder

## Send & receive message 
Open iex by `iex -S mix` in command line and copy/paste next lines

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

Now, You can send the first message to the process that is waiting for the message.
```elixir
send(receiving_process_pid, {:message, "Hello World"})
# Hello World
```

Process, already received the message and died.
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


