import 'package:grpc/grpc.dart';
import 'package:mnm/generated/remote_todo.pbgrpc.dart';

class OwnServer {
  final ClientChannel channel;
  late final RemoteTasksServiceClient client;

  OwnServer()
      : channel = ClientChannel(
          'localhost',
          port: 50052,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        ) {
    client = RemoteTasksServiceClient(channel);
  }

  
  Future<void> shutdown() async => await channel.shutdown();
}