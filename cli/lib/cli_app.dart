import 'package:grpc/grpc.dart';
import 'package:mnm/generated/todo.pbgrpc.dart';

class TodoCli {
  final ClientChannel channel;
  late final TodoServiceClient client;

  TodoCli()
      : channel = ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        ) {
    client = TodoServiceClient(channel);
  }

  Future<void> shutdown() async => await channel.shutdown();
}
