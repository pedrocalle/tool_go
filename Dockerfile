# Stage 1: Build
FROM public.ecr.aws/docker/library/elixir:1.17 AS build

RUN apt-get update && \
    apt-get install -y build-essential git python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Cache deps
COPY mix.exs mix.lock ./ 
COPY config ./config
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get

# Build release
COPY . .
RUN MIX_ENV=prod mix release

# Stage 2: Runtime
FROM debian:bookworm-slim AS app

RUN apt-get update && \
    apt-get install -y libssl3 libstdc++6 ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=build /app/_build/prod/rel/tool_go ./
COPY --from=build /app/priv/certs ./priv/certs

ENV HOME=/app
ENV MIX_ENV=prod

CMD ["bin/tool_go", "start"]
