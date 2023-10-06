import 'package:freezed_annotation/freezed_annotation.dart';

part 'vpn_server.freezed.dart';

part 'vpn_server.g.dart';

@freezed
class VpnServer with _$VpnServer {
  const factory VpnServer({
    required String name,
    required String config,
    required bool isFree,
    required bool isAvailable,
  }) = _VpnServer;

  factory VpnServer.fromJson(Map<String, Object?> json) =>
      _$VpnServerFromJson(json);
}
