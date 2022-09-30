import 'dart:async';
import 'dart:collection';

import 'package:ably_flutter/ably_flutter.dart';
import 'package:ably_flutter/src/platform/platform_internal.dart';

Map<int?, Rest> _restInstances = {};

/// BEGIN LEGACY DOCSTRING
/// Returns readonly copy of instances of all [Rest] clients created.
/// END LEGACY DOCSTRING
Map<int?, Rest> get restInstances => UnmodifiableMapView(_restInstances);

/// BEGIN LEGACY DOCSTRING
/// A simple stateless API to interact directly with Ably’s REST API
///
/// Learn more at the [REST Client Library API documentation](https://ably.com/documentation/rest).
/// END LEGACY DOCSTRING

/// BEGIN EDITED CANONICAL DOCSTRING
/// A client that offers a simple stateless API to interact directly with Ably's
/// REST API.
/// END EDITED CANONICAL DOCSTRING
class Rest extends PlatformObject {
  /// BEGIN LEGACY DOCSTRING
  /// Pass a [ClientOptions] to configure the rest client.
  /// END LEGACY DOCSTRING
  ///
  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Construct a [Rest] object using an Ably [options] object.
  /// END EDITED CANONICAL DOCSTRING
  Rest({required this.options}) : super() {
    channels = RestChannels(this);
    push = Push(rest: this);
  }

  /// BEGIN LEGACY DOCSTRING
  /// Create a rest client from an API key without configuring other parameters
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Constructs a RestClient object using an Ably API [key] or token string
  /// that's used to validate the cliet.
  /// END EDITED CANONICAL DOCSTRING
  factory Rest.fromKey(String key) => Rest(options: ClientOptions(key: key));

  @override
  Future<int?> createPlatformInstance() async {
    final handle = await invokeWithoutHandle<int>(PlatformMethod.createRest, {
      TxTransportKeys.options: options,
    });
    _restInstances[handle] = this;
    return handle;
  }

  /// BEGIN LEGACY DOCSTRING
  /// a custom auth object to perform authentication related operations
  /// based on the [options]
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSC5
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// An [Auth] object.
  /// END EDITED CANONICAL DOCSTRING
  // Auth? auth;

  /// BEGIN LEGACY DOCSTRING
  /// [ClientOptions] indicating authentication and other settings for this
  /// instance to interact with ably service
  /// END LEGACY DOCSTRING

  late ClientOptions options;

  /// BEGIN LEGACY DOCSTRING
  /// creates and sends a raw request to ably service
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSC19
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Makes a REST request to a provided [path] using a [method], such as GET,
  /// POST.
  /// [params] can be specified to include in the URL query of the
  /// request. The parameters depend on the endpoint being queried. See the
  /// [REST API reference](https://ably.com/docs/api/rest-api) for the available
  /// parameters of each endpoint.
  /// You can also provide the JSON [body] and additional [headers] to include
  /// in the request.
  /// Returns a [HttpPaginatedResponse] object returned by
  /// the HTTP request, containing an empty or JSON-encodable object.
  ///
  /// This is provided as a convenience for developers who wish to use REST API
  /// functionality that is either not documented or is not yet included in the
  /// public API, without having to directly handle features such as
  /// authentication, paging, fallback hosts, MsgPack and JSON support.
  /// END EDITED CANONICAL DOCSTRING
  // Future<HttpPaginatedResponse> request({
  //   String? method,
  //   String? path,
  //   Map<String, dynamic>? params,
  //   Object? body,
  //   Map<String, String>? headers,
  // }) {
  //   throw UnimplementedError();
  // }

  /// BEGIN LEGACY DOCSTRING
  /// gets stats based on params as a [PaginatedResult]
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSC6
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Queries the REST /stats API and retrieves your application's usage
  /// statistics. You must specify the [start] time from which stats are
  /// retrieved, specified as milliseconds since the Unix epoch, and the [end]
  /// time until stats are retrieved, specified as milliseconds since the Unix
  /// epoch.
  /// Set the [direction], which describes the order in which stats are returned
  /// in. Valid values are backwards which orders stats from most recent to
  /// oldest, or forwards which orders stats from oldest to most recent. The
  /// default is backwards.
  /// Provide [limit], which specifies upper limit on the number of
  /// stats returned (the default is 100, and the maximum is 1000).
  /// Set the [unit] as either a minute, hour, day or month. Based on the unit
  /// selected, the given start or end times are rounded down to the start of
  /// the relevant interval depending on the unit granularity of the query.
  /// Returns a [PaginatedResult] object containing an array of [Stats] objects.
  ///
  /// See the [Stats docs](https://ably.com/docs/general/statistics).
  /// END EDITED CANONICAL DOCSTRING
  // Future<PaginatedResult<Stats>> stats([Map<String, dynamic>? params]) {
  //   throw UnimplementedError();
  // }

  /// BEGIN LEGACY DOCSTRING
  /// returns server time
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSC16
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Retrieves the time from the Ably service as milliseconds since the Unix
  /// epoch. Clients that do not have access to a sufficiently well maintained
  /// time source and wish to issue Ably [TokenRequest]s with a more accurate
  /// timestamp should use the [AuthOptions.queryTime] property on a
  /// [ClientOptions] object instead of this method.
  /// END EDITED CANONICAL DOCSTRING
  Future<DateTime> time() async {
    final time = await invokeRequest<int>(PlatformMethod.restTime);
    return DateTime.fromMillisecondsSinceEpoch(time);
  }

  /// BEGIN LEGACY DOCSTRING
  /// a push object interacting with Push API, such as
  /// subscribing for push notifications by clientId.
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A [Push] object.
  /// END EDITED CANONICAL DOCSTRING
  late Push push;

  /// BEGIN LEGACY DOCSTRING
  /// collection of [RestChannel] instances
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSN1
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A [Channels] object.
  /// END EDITED CANONICAL DOCSTRING
  late RestChannels channels;

  /// BEGIN LEGACY DOCSTRING
  /// represents the current state of the device in respect of it being a
  /// target for push notifications.
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#RSH8
  /// END LEGACY DOCSTRING

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Retrieves a [LocalDevice] object that represents the
  /// current state of the device as a target for push notifications.
  /// END EDITED CANONICAL DOCSTRING
  Future<LocalDevice> device() async =>
      invokeRequest<LocalDevice>(PlatformMethod.pushDevice);
}
