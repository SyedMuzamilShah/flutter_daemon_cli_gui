
# mnm: Multi-Platform Todo App

`mnm` is a full-stack, multi-platform Todo application built with Flutter, gRPC, and Dart. It features:

- **Flutter GUI**: Modern, reactive todo app for desktop/mobile/web
- **gRPC Daemon**: Backend server for local and remote task management
- **CLI Client**: Command-line interface for managing todos

---

## Project Structure

- `lib/` — Flutter app source code
- `daemon/` — gRPC server (daemon) for local/remote tasks
- `cli/` — Dart CLI client for interacting with the daemon
- `protos/` — Protocol Buffers definitions for gRPC

## Features

- Add, list, toggle, and delete local tasks (persisted in SQLite)
- Fetch and view remote tasks from [JSONPlaceholder](https://jsonplaceholder.typicode.com/todos)
- Real-time updates in the Flutter app using signals
- Cross-platform: Flutter GUI, CLI, and daemon all run on desktop

## Getting Started

### 1. Install Dependencies

```
flutter pub get
cd daemon && dart pub get
cd ../cli && dart pub get
```

### 2. Generate gRPC Code

Install protoc and Dart plugins, then run:

```
protoc --dart_out=grpc:lib/generated -Iprotos protos/todo.proto
protoc --dart_out=grpc:lib/generated -Iprotos protos/remote_todo.proto
```

### 3. Run the Daemon (gRPC Server)

```
cd daemon
dart run bin/daemon.dart
```

### 4. Run the Flutter App

```
flutter run
```

### 5. Use the CLI

```
cd cli
dart run bin/cli.dart <command>
```

#### CLI Commands

- `list` — List all local tasks
- `add --title <task>` — Add a new local task
- `toggle --id <id> --completed <true|false>` — Toggle a task's completion
- `delete --id <id>` — Delete a task
- `remote-list` — List all remote tasks
- `remote-fetch --id <id>` — Fetch a remote task by ID

---

## Architecture

- **Flutter App**: Connects to the daemon via gRPC, manages state with signals, and provides a tabbed UI for local/remote tasks.
- **Daemon**: Runs a gRPC server, persists local tasks in SQLite (Drift), fetches remote tasks from JSONPlaceholder, and exposes both via gRPC.
- **CLI**: Connects to the daemon via gRPC and provides commands for all major operations.

## Protobuf APIs

See `protos/todo.proto` and `protos/remote_todo.proto` for service and message definitions.

## Development

- All code is Dart/Flutter
- Uses `grpc`, `protobuf`, `drift`, `signals`, and `signals_flutter` packages

---

## License

MIT License. See LICENSE file.
