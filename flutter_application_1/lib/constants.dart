import 'package:flutter/material.dart';
import 'models/tournament_model.dart';

class AppColors {
  static const Color background = Color(0xFF0D0D0D);
  static const Color cardBg = Color(0xFF1A1A1A);
  static const Color redAccent = Color(0xFFFF3B3B);
  static const Color textGrey = Colors.grey;
  static const Color neonGreen = Color(0xFFB2FF59);
}


List<TournamentModel> demoTournaments = [
  // Card 1
  TournamentModel(
    id: 't1',
    imagePath: 'assets/images/i1.png',
    title: 'GWCS SEASON 1',
    matchDate: 'Sun Oct 05 | 2:30pm',
    mapName: 'Erangle',
    entryFee: '₹ 59/player',

  ),
  // Card 2
  TournamentModel(
    id: 't2',
    imagePath: 'assets/images/i2.png',
    title: 'INDIGUS SERIES',
    matchDate: 'Sun Oct 05 | 2:30pm',
    mapName: 'Erangle',
    entryFee: '₹ 59/player',
    prizePool: '₹ 3000',
    elo: '500 ELO',
    registeredSquads: 23,
    totalSquads: 25,
  ),
  // Card 3
  TournamentModel(
    id: 't3',
    imagePath: 'assets/images/i3.png',
    title: 'NEON WARFARE',
    matchDate: 'Sun Oct 05 | 2:30pm',
    mapName: 'Erangle',
    entryFee: '₹ 59/player',
    prizePool: '₹ 3000',
    elo: '500 ELO',
    registeredSquads: 23,
    totalSquads: 25,
  ),
];