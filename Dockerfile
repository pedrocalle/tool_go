# Stage 1: Build
FROM hexpm/elixir:1.16.1-erlang-26.2.1-alpine-3.19 AS build

RUN apk add --no-cache build-base git python3

WORKDIR /app

# Cache deps
COPY mix.exs mix.lock ./
COPY config config
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get

# Build release
COPY . .
RUN MIX_ENV=prod mix release

# Stage 2: Runtime
FROM alpine:3.19 AS app

RUN apk add --no-cache libstdc++ openssl ncurses

WORKDIR /app
COPY --from=build /app/_build/prod/rel/tool_go ./

ENV HOME=/app
ENV MIX_ENV=prod

CMD ["bin/tool_go", "start"]
