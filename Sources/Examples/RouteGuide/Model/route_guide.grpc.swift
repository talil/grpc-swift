//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: route_guide.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import GRPC
import NIO
import NIOHTTP1
import SwiftProtobuf


/// Usage: instantiate Routeguide_RouteGuideClient, then call methods of this protocol to make API calls.
public protocol Routeguide_RouteGuideClientProtocol {
  func getFeature(_ request: Routeguide_Point, callOptions: CallOptions?) -> UnaryCall<Routeguide_Point, Routeguide_Feature>
  func listFeatures(_ request: Routeguide_Rectangle, callOptions: CallOptions?, handler: @escaping (Routeguide_Feature) -> Void) -> ServerStreamingCall<Routeguide_Rectangle, Routeguide_Feature>
  func recordRoute(callOptions: CallOptions?) -> ClientStreamingCall<Routeguide_Point, Routeguide_RouteSummary>
  func routeChat(callOptions: CallOptions?, handler: @escaping (Routeguide_RouteNote) -> Void) -> BidirectionalStreamingCall<Routeguide_RouteNote, Routeguide_RouteNote>
}

public final class Routeguide_RouteGuideClient: GRPCClient, Routeguide_RouteGuideClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions

  /// Creates a client for the routeguide.RouteGuide service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  public init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }

  /// A simple RPC.
  ///
  /// Obtains the feature at a given position.
  ///
  /// A feature with an empty name is returned if there's no feature at the given
  /// position.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetFeature.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getFeature(_ request: Routeguide_Point, callOptions: CallOptions? = nil) -> UnaryCall<Routeguide_Point, Routeguide_Feature> {
    return self.makeUnaryCall(path: "/routeguide.RouteGuide/GetFeature",
                              request: request,
                              callOptions: callOptions ?? self.defaultCallOptions)
  }

  /// A server-to-client streaming RPC.
  ///
  /// Obtains the Features available within the given Rectangle.  Results are
  /// streamed rather than returned at once (e.g. in a response message with a
  /// repeated field), as the rectangle may cover a large area and contain a
  /// huge number of features.
  ///
  /// - Parameters:
  ///   - request: Request to send to ListFeatures.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  public func listFeatures(_ request: Routeguide_Rectangle, callOptions: CallOptions? = nil, handler: @escaping (Routeguide_Feature) -> Void) -> ServerStreamingCall<Routeguide_Rectangle, Routeguide_Feature> {
    return self.makeServerStreamingCall(path: "/routeguide.RouteGuide/ListFeatures",
                                        request: request,
                                        callOptions: callOptions ?? self.defaultCallOptions,
                                        handler: handler)
  }

  /// A client-to-server streaming RPC.
  ///
  /// Accepts a stream of Points on a route being traversed, returning a
  /// RouteSummary when traversal is completed.
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata, status and response.
  public func recordRoute(callOptions: CallOptions? = nil) -> ClientStreamingCall<Routeguide_Point, Routeguide_RouteSummary> {
    return self.makeClientStreamingCall(path: "/routeguide.RouteGuide/RecordRoute",
                                        callOptions: callOptions ?? self.defaultCallOptions)
  }

  /// A Bidirectional streaming RPC.
  ///
  /// Accepts a stream of RouteNotes sent while a route is being traversed,
  /// while receiving other RouteNotes (e.g. from other users).
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata and status.
  public func routeChat(callOptions: CallOptions? = nil, handler: @escaping (Routeguide_RouteNote) -> Void) -> BidirectionalStreamingCall<Routeguide_RouteNote, Routeguide_RouteNote> {
    return self.makeBidirectionalStreamingCall(path: "/routeguide.RouteGuide/RouteChat",
                                               callOptions: callOptions ?? self.defaultCallOptions,
                                               handler: handler)
  }

}

/// To build a server, implement a class that conforms to this protocol.
public protocol Routeguide_RouteGuideProvider: CallHandlerProvider {
  /// A simple RPC.
  ///
  /// Obtains the feature at a given position.
  ///
  /// A feature with an empty name is returned if there's no feature at the given
  /// position.
  func getFeature(request: Routeguide_Point, context: StatusOnlyCallContext) -> EventLoopFuture<Routeguide_Feature>
  /// A server-to-client streaming RPC.
  ///
  /// Obtains the Features available within the given Rectangle.  Results are
  /// streamed rather than returned at once (e.g. in a response message with a
  /// repeated field), as the rectangle may cover a large area and contain a
  /// huge number of features.
  func listFeatures(request: Routeguide_Rectangle, context: StreamingResponseCallContext<Routeguide_Feature>) -> EventLoopFuture<GRPCStatus>
  /// A client-to-server streaming RPC.
  ///
  /// Accepts a stream of Points on a route being traversed, returning a
  /// RouteSummary when traversal is completed.
  func recordRoute(context: UnaryResponseCallContext<Routeguide_RouteSummary>) -> EventLoopFuture<(StreamEvent<Routeguide_Point>) -> Void>
  /// A Bidirectional streaming RPC.
  ///
  /// Accepts a stream of RouteNotes sent while a route is being traversed,
  /// while receiving other RouteNotes (e.g. from other users).
  func routeChat(context: StreamingResponseCallContext<Routeguide_RouteNote>) -> EventLoopFuture<(StreamEvent<Routeguide_RouteNote>) -> Void>
}

extension Routeguide_RouteGuideProvider {
  public var serviceName: String { return "routeguide.RouteGuide" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handleMethod(_ methodName: String, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "GetFeature":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.getFeature(request: request, context: context)
        }
      }

    case "ListFeatures":
      return ServerStreamingCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.listFeatures(request: request, context: context)
        }
      }

    case "RecordRoute":
      return ClientStreamingCallHandler(callHandlerContext: callHandlerContext) { context in
        return self.recordRoute(context: context)
      }

    case "RouteChat":
      return BidirectionalStreamingCallHandler(callHandlerContext: callHandlerContext) { context in
        return self.routeChat(context: context)
      }

    default: return nil
    }
  }
}


// Provides conformance to `GRPCPayload`
extension Routeguide_Point: GRPCProtobufPayload {}
extension Routeguide_Rectangle: GRPCProtobufPayload {}
extension Routeguide_Feature: GRPCProtobufPayload {}
extension Routeguide_RouteNote: GRPCProtobufPayload {}
extension Routeguide_RouteSummary: GRPCProtobufPayload {}
