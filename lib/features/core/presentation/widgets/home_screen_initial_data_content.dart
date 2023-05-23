import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/match_briefs_list.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/player_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/overlay_suppport_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenInitialDataContent extends StatelessWidget {
  const HomeScreenInitialDataContent({
    super.key,
    required this.initialData,
  });

  final InitialDataValue initialData;

  @override
  Widget build(BuildContext context) {
    // TODO we could make a layout out of this padding, to be reused
    return Padding(
      padding: EdgeInsets.all(SpacingConstants.small),
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: "My next match",
                ),
                Tab(
                  text: "My joined matches",
                ),
                Tab(
                  text: "My match invitations",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      PlayerBriefOverview(),
                      TestNotificationsContainer(),
                      SizedBox(
                        height: SpacingConstants.small,
                      ),
                      MatchInfoBriefOverview(
                        matchInfo: initialData.nextMatch,
                        noMatchInfoLabel: "No upcoming matches",
                      ),
                    ],
                  ),
                  MatchBriefsList(
                    matches: initialData.joinedMatches,
                    title: "",
                  ),
                  MatchBriefsList(
                    matches: initialData.invitedMatches,
                    // TODO title should be nullable and shown conditionally
                    title: "",
                  ),
                  // TODO old
                  // MatchBriefsList(
                  //   matches: initialData.joinedMatches,
                  // ),
                  // MatchBriefsList(
                  //   matches: initialData.invitedMatches,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

// TODO this is not used at all
  // Map<String, List<MatchModel>> _initialDataToMatchesListsMap(
  //   InitialDataValue initialDataValue,
  // ) {
  //   final List<MatchModel> upcomingMatches = initialData.joinedMatches;
  //   final List<MatchModel> invitedMatches = initialData.invitedMatches;

  //   final Map<String, List<MatchModel>> map = {
  //     "Upcoming matches": upcomingMatches,
  //     "Invited matches": invitedMatches,
  //   };

  //   return map;
  // }
}

// TODO deleete this eventually

class TestNotificationsContainer extends StatefulWidget {
  const TestNotificationsContainer({
    super.key,
  });

  @override
  State<TestNotificationsContainer> createState() =>
      _TestNotificationsContainerState();
}

class _TestNotificationsContainerState
    extends State<TestNotificationsContainer> {
  late final FirebaseMessaging _firebaseMessaging;

  @override
  void initState() {
    super.initState();
    _testRegisterNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text("Total number of notifications:"),
          Text("3"),
          SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () async {
// TODO test only
              final String idToken =
                  await FirebaseAuth.instance.currentUser!.getIdToken();

              log("idToken: $idToken");

// TODO THIS IS TES ONLY
              final FirebaseFunctions functions = FirebaseFunctions.instanceFor(
                region: 'europe-west3',
              );

              final HttpsCallable callable =
                  functions.httpsCallable('sendNotification');

              try {
                final HttpsCallableResult result = await callable.call();

                log("result: $result");
              } on FirebaseFunctionsException catch (e) {
                log(e.code);
                log(e.message ?? "no message");
                log(e.details.toString());
              } catch (e) {
                log(e.runtimeType.toString());
                log("error!!!!!: $e");
              }
            },
            child: Text("Send notification"),
          ),
        ],
      ),
    );
  }

  Future<void> _testRegisterNotification() async {
    _firebaseMessaging = FirebaseMessaging.instance;

    // TODO use permission handler for this later
    // this seems to be needed only for ios
    final NotificationSettings notificationSettings =
        await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

// TODO this seems to silently grant on android
    if (notificationSettings.authorizationStatus !=
        AuthorizationStatus.authorized) {
      print("User declined notification permission");
      return;
    }

    print("User accepted notification permission");

    // TODO test
    final ProviderContainer container = ProviderContainer();
    late final OverlaySupportWrapper overlaySupportWrapper =
        container.read(overlaySupportWrapperProvider);

    // TODO this is a subscription, so dont forget to unsubscribe
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // TODO this handles foreground notifications only
      // TODO we will be having this is a cubit, or such some
      print("onMessage!!!!!!!!!!!!!!!: $message");

      // overlaySupportWrapper.showToast("Šta?!");

      // await Future.delayed(Duration(seconds: 2));
      final String? messageTitle = message.notification?.title;
      if (messageTitle == null) return;

      overlaySupportWrapper.showWidgetNotification(Text(messageTitle));
    });
  }
}

// TODO also test class
class PushNotification {
  PushNotification({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}
