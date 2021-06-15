# OtelGettingStartedElixir

Assuming the 3 env vars are set as per [the erlang getting started repo](https://github.com/tsloughter/otel_getting_started):

```sh
export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=https://api.honeycomb.io:443
export OTEL_EXPORTER_OTLP_PROTOCOL=grpc
export OTEL_EXPORTER_OTLP_TRACES_HEADERS=x-honeycomb-team=<HONEYCOMB_API_TOKEN>,x-honeycomb-dataset=experiments
```

Running `iex -S mix` works and publishes data to Honeycomb.io


### Other notes:

- The TLS configuration does not yet validate certificates in this example, but shows the base mechanism working.
- [Minor] The config passed to `opentelemetry_exporter` when it's being set to the exporter for `otel_batch_processor` needs to be a map (`%{}`), not a list (however the console exporter from the [getting started guide](https://opentelemetry.io/docs/erlang/getting-started/) uses a list)
  - This is because the example here works from the `main` branch of OTel for Erlang/OTP and Elixir, which contains slight variations compared to the getting-started doc that works on the older release candidate.
