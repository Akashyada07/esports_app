class TournamentModel {
  final String id;
  final String imagePath;
  final String title;
  final String matchDate;
  final String mapName;
  final String entryFee;

  final String? prizePool;
  final String? elo;
  final int? registeredSquads;
  final int? totalSquads;

  TournamentModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.matchDate,
    required this.mapName,
    required this.entryFee,
    this.prizePool,
    this.elo,
    this.registeredSquads,
    this.totalSquads,
  });
}