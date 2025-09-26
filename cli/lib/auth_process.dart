import 'package:grpc/grpc.dart';
import 'package:mnm/core/generated/sso_google.pbgrpc.dart';

class GoogleSSOClient {
  final ClientChannel channel;
  late final GoogleSSOServiceClient client;

  GoogleSSOClient()
      : channel = ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        ) {
    client = GoogleSSOServiceClient(channel);
  }

  Future<void> shutdown() async => await channel.shutdown();
}
