import Config

 config :opentelemetry, :processors,
   otel_batch_processor: %{
     exporter: {:opentelemetry_exporter, %{protocol: :grpc}}
   }

# config :opentelemetry, :opentelemetry_exporter, protocol: :grpc
