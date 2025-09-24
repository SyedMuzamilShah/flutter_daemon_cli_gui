import 'package:grpc/grpc.dart';
import 'package:mnm/generated/remote_todo.pbgrpc.dart';

class RemoteTodoCli {
  final ClientChannel channel;
  late final RemoteTasksServiceClient client;

  RemoteTodoCli()
      : channel = ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        ) {
    client = RemoteTasksServiceClient(channel);
  }

  Future<void> shutdown() async => await channel.shutdown();
}
