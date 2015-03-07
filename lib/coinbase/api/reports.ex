defmodule Coinbase.API.Reports do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "reports"
  @data_struct Coinbase.Report
  @collection_name String.to_atom(@endpoint)

  @doc """
  Lists all reports

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Show a report
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end

  @doc """
  Generate a new report

  Optional params:
    account_id (string): Specify for which account is the order created. The default is your primary account
    report[callback_url] (string): A callback URL that will receive POST notifications after a new report is generated. The format of the post will be the same as a response from Coinbase.API.Reports.get(pid, id)
    report[time_range] (string): Must be one of: today, yesterday, past_7, past_30, month_to_date, last_full_month, year_to_date, last_full_year, all, custom. Defaults to past_30. If custom, then time_range_start and time_range_end are required.
    report[time_range_end] (string): End time in MM/DD/YYYY format. Required if time_range is set to custom.
    report[start_type] (string): Must be one of: now, on. now will generate a report immediately. on will use next_run_date and next_run_time to defer the first report until the specific time.
    report[next_run_date] (string): Next run date in MM/DD/YYYY format. Only used if start_type is on.
    report[next_run_time] (string): Next run time in HH:MM format. Only used if start_type is on.
    report[repeat] (string): Must be one of: never, daily, weekly, every_two_weeks, monthly, quarterly, yearly. Defaults to never.
    report[times] (integer): Number of times to repeat. Defaults to -1, meaning infinite. Only applies if repeat is not never
  """
  @spec create(pid, map, map) :: Coinbase.response
  def create(coinbase, report, optionals \\ %{}) do
    params = %{report: button}
    params = add_optionals(params, optionals)
    Base.post(coinbase, @endpoint, params, @data_struct, @collection_name)
  end
end
