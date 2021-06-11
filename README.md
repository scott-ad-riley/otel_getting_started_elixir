# OtelGettingStartedElixir

Assuming the 3 env vars are set as per [the erlang getting started repo](https://github.com/tsloughter/otel_getting_started):

```sh
export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=https://api.honeycomb.io:443
export OTEL_EXPORTER_OTLP_PROTOCOL=grpc
export OTEL_EXPORTER_OTLP_TRACES_HEADERS=x-honeycomb-team=<HONEYCOMB_API_TOKEN>,x-honeycomb-dataset=experiments
```

Running `iex -S mix` prints out the warning:

```
[warn]  OTLP tracer, :opentelemetry_exporter, failed to initialize when using GRPC protocol. Verify you have the `grpcbox` dependency included.
```

### Other notes:

- As far as I can see it's a `error:badarg` being thrown by `ExporterModule:init(Config)` in `opentelemetry` that causes the issue, however digging into that part of the `opentelemetry_exporter` package I can't seem to see a difference between the parameters passed to `grpc_channel:start_link` when running the erlang version vs. the elixir one
- Setting `OTEL_EXPORTER_OTLP_PROTOCOL` to `grpc` doesn't seem to do anything - I've had to set it in `config/runtime.exs` to get picked up
- I've set all 3 dependencies to work from `1.0.0-rc.1` (when testing with the erlang project [I've done the same](https://github.com/scott-ad-riley/otel_getting_started/commit/f4c8977178956e8a07f18a8c5be4a705cc0065ec))
- [Minor] The config passed to `opentelemetry_exporter` when it's being set to the exporter for `otel_batch_processor` needs to be a map (`%{}`), not a list (however the console exporter from the [getting started guide](https://opentelemetry.io/docs/erlang/getting-started/) uses a list)
