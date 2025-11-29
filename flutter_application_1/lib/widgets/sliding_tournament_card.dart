import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/tournament_model.dart';

class SlidingTournamentCard extends StatelessWidget {
  final TournamentModel tournament;

  const SlidingTournamentCard({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {

    bool hasPrizeDetails = tournament.prizePool != null;

    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))
          ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header Date Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Match Date - ${tournament.matchDate}",
                    style: const TextStyle(color: AppColors.textGrey, fontSize: 12)
                ),
                const Icon(Icons.help_outline, color: AppColors.textGrey, size: 16),
              ],
            ),
          ),

          // 2. Image Banner
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage(tournament.imagePath),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) => const Icon(Icons.broken_image),
              ),
            ),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black.withOpacity(0.7), Colors.transparent]
                    )
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(12),

                child: Text(tournament.title, style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic
                ),)
            ),
          ),




          // 3. MiddleSection (Map, Fees)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("BATTLE ROYAL", style: TextStyle(fontSize: 10, color: AppColors.textGrey)),
                    const SizedBox(height: 4),
                    Text(tournament.mapName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.blueAccent.withOpacity(0.5))
                  ),
                  child: const Icon(Icons.gamepad, color: Colors.blueAccent, size: 20),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("ENTRY FEES", style: TextStyle(fontSize: 10, color: AppColors.textGrey)),
                    const SizedBox(height: 4),
                    Text(tournament.entryFee, style: const TextStyle(fontSize: 14, color: AppColors.neonGreen)),
                  ],
                ),
              ],
            ),
          ),

          // 4. Bottom Prize & Squad Section (Conditional)

          if (hasPrizeDetails)
            Column(
              children: [
                const Divider(color: Colors.white10, height: 1),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("PRIZE POOL:", style: TextStyle(fontSize: 10, color: AppColors.textGrey)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(tournament.prizePool!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                              const SizedBox(width: 8),
                              const Icon(Icons.circle, size: 6, color: AppColors.redAccent),
                              const SizedBox(width: 8),
                              Text(tournament.elo!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(text: TextSpan(
                              style: const TextStyle(fontFamily: 'Oxanium'),
                              children: [
                                TextSpan(text: "${tournament.registeredSquads}", style: const TextStyle(color: Colors.white)),
                                TextSpan(text: "/${tournament.totalSquads} SQUADS", style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
                              ]
                          )),
                          const SizedBox(height: 4),
                          const Text("KNOCKOUT", style: TextStyle(fontSize: 10, color: AppColors.textGrey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          if (!hasPrizeDetails) const SizedBox(height: 10),
        ],
      ),
    );
  }
}