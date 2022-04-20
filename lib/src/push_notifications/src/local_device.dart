import 'package:ably_flutter/ably_flutter.dart';
import 'package:meta/meta.dart';

/// Current state of the device in respect of it being a target for
/// push notifications.
///
/// https://docs.ably.com/client-lib-development-guide/features/#RSH8
@immutable
class LocalDevice extends DeviceDetails {
  /// Device token. Generated locally, if not available.
  final String? deviceSecret;

  /// A token generated by Ably to authenticate the device.
  ///
  /// Previously called `deviceToken`, but this was ambiguous because it
  /// overlaps with APNs device token. Now both terms exist in implementations
  /// Use `X-Ably-DeviceToken` when authenticating with Ably.
  final String? deviceIdentityToken;

  /// Initializes an instance without any defaults
  LocalDevice({
    required DeviceDetails deviceDetails,
    this.deviceIdentityToken,
    this.deviceSecret,
  }) : super(
          clientId: deviceDetails.clientId,
          formFactor: deviceDetails.formFactor,
          id: deviceDetails.id,
          metadata: deviceDetails.metadata,
          platform: deviceDetails.platform,
          push: deviceDetails.push,
        );
}
