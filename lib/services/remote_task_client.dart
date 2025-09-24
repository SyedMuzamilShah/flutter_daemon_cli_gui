import 'package:grpc/grpc.dart';
import 'package:mnm/generated/remote_todo.pbgrpc.dart';

class RemoteTaskClient {
  final ClientChannel _channel;
  late final RemoteTasksServiceClient client;

  RemoteTaskClient()
      : _channel = ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        ) {
    client = RemoteTasksServiceClient(_channel);
  }

  Future<void> shutdown() => _channel.shutdown();
}
