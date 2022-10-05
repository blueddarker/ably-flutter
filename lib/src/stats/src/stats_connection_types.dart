import 'package:ably_flutter/ably_flutter.dart';

/// BEGIN LEGACY DOCSTRING
/// ConnectionTypes contains a breakdown of summary stats data
/// for different (TLS vs non-TLS) connection types
///
/// https://docs.ably.com/client-lib-development-guide/features/#TS4
/// END LEGACY DOCSTRING

/// BEGIN EDITED CANONICAL DOCSTRING
/// Contains a breakdown of summary stats data for different (TLS vs non-TLS)
/// connection types.
/// END EDITED CANONICAL DOCSTRING
abstract class StatsConnectionTypes {
  /// BEGIN LEGACY DOCSTRING
  /// All connection count (includes both TLS & non-TLS connections).
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A [StatsResourceCount] object containing a breakdown of usage by scope
  /// over TLS connections (both TLS and non-TLS).
  /// END EDITED CANONICAL DOCSTRING
  StatsResourceCount? all;

  /// BEGIN LEGACY DOCSTRING
  /// Non-TLS connection count (unencrypted).
  /// END LEGACY DOCSTRING

  /// BEGIN CANONICAL DOCSTRING
  /// A [StatsResourceCount] object containing a breakdown of usage by scope
  /// over non-TLS connections.
  /// END CANONICAL DOCSTRING
  StatsResourceCount? plain;

  /// BEGIN LEGACY DOCSTRING
  /// TLS connection count.
  /// END LEGACY DOCSTRING

  /// BEGIN CANONICAL DOCSTRING
  /// A [StatsResourceCount] object containing a breakdown of usage by scope
  /// over TLS connections.
  /// END CANONICAL DOCSTRING
  StatsResourceCount? tls;
}
