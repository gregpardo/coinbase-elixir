defmodule Coinbase.Report do
  @type t :: %Coinbase.Report {
    id: binary,
    type: binary,
    status: binary,
    email: binary,
    repeat: binary,
    time_range: binary,
    callback_url: binary,
    file_url: binary,
    times: integer,
    times_run: integer,
    last_run: binary,
    next_run: binary,
    created_at: binary
  }

  defstruct [
    :id,
    :type,
    :status,
    :email,
    :repeat,
    :time_range,
    :callback_url,
    :file_url,
    :times,
    :times_run,
    :last_run,
    :next_run,
    :created_at
    ]
end
