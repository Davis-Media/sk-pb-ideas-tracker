FROM node:20-alpine AS base-web
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
COPY /web /app
WORKDIR /app

FROM base-web AS build-web
RUN pnpm install
RUN pnpm run build

FROM golang:1.22-alpine AS base-pb
WORKDIR /app

FROM base-pb AS build-pb
COPY /pb/go.mod /pb/go.sum /pb/main.go /app/
RUN CGO_ENABLED=0 go build -o my-pb

FROM base-pb
COPY --from=build-pb /app/my-pb /app/my-pb
COPY --from=build-web /app/build /app/pb_public
EXPOSE 8090
CMD [ "./my-pb", "serve", "--http=0.0.0.0:8090"]