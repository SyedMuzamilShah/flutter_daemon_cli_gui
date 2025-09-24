import 'package:grpc/grpc.dart';
import 'package:mnm/generated/todo.pbgrpc.dart';

class LocalTaskClient {
  final ClientChannel _channel;
  late final TodoServiceClient client;

  LocalTaskClient()
      : _channel = ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        ) {
    client = TodoServiceClient(_channel);
  }

  Future<void> shutdown() => _channel.shutdown();
}
