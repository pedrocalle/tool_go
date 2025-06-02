# Stage 1: Build
FROM public.ecr.aws/docker/library/elixir:1.17 AS build

RUN apt-get update && apt-get install -y build-essential git python3

WORKDIR /app

# Cache deps
COPY mix.exs mix.lock ./ 
COPY config ./config
RUN mix local.hex --force && mix local.rebar --force
RUN ecto.migrate
RUN mix deps.get

# Build release
COPY . .
RUN MIX_ENV=prod mix release

# Stage 2: Runtime
FROM public.ecr.aws/debian/debian:bookworm-slim AS app

RUN apt-get update && apt-get install -y libstdc++6 openssl libncurses6 && apt-get clean

WORKDIR /app

COPY --from=build /app/_build/prod/rel/tool_go ./
COPY --from=build /app/priv ./priv

ENV HOME=/app
ENV MIX_ENV=prod

CMD ["bin/tool_go", "start"]
