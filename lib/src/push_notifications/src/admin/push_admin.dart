import 'package:ably_flutter/ably_flutter.dart';

/// BEGIN LEGACY DOCSTRING
/// Class providing push notification administrative functionality
/// for registering devices and attaching to channels etc.
///
/// https://docs.ably.com/client-lib-development-guide/features/#RSH1
/// END LEGACY DOCSTRING

/// BEGIN CANONICAL DOCSTRING
/// Enables the management of device registrations and push notification
/// subscriptions. Also enables the publishing of push notifications to devices.
/// END CANONICAL DOCSTRING
abstract class PushAdmin {
  /// BEGIN LEGACY DOCSTRING
  /// Manage device registrations.
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSH1b
  /// END LEGACY DOCSTRING
  PushDeviceRegistrations? deviceRegistrations;

  /// BEGIN LEGACY DOCSTRING
  /// Manage channel subscriptions for devices or clients.
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSH1c
  /// END LEGACY DOCSTRING
  PushChannelSubscriptions? channelSubscriptions;

  /// BEGIN LEGACY DOCSTRING
  /// https://docs.ably.com/client-lib-development-guide/features/#RSH1a
  /// END LEGACY DOCSTRING
  Future<void> publish(
    Map<String, dynamic> recipient,
    Map<String, dynamic> payload,
  );
}
