

// TODO deprecated
// class MatchBriefsList extends StatelessWidget {
//   const MatchBriefsList({
//     super.key,
//     required this.matches,
//   });

//   final List<MatchModel> matches;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: matches.length,
//       itemBuilder: (context, index) {
//         final MatchModel match = matches[index];

//         return Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: SpacingConstants.medium / 2,
//           ),
//           child: MatchBriefCard(
//             key: ValueKey(match.id),
//             match: match,
//           ),
//         );
//       },
//     );
//   }
// }
