import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/category_icon.dart';
import '../widgets/game_mode_card.dart';
import '../widgets/sliding_tournament_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.92);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // Custom AppBar
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.bolt, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text("1500 ELO", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white24)
            ),
            child: const Row(
              children: [
                Text("BATTLEGROUNDS", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // 1. Categories Row
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryIcon(icon: Icons.sports_esports, label: "Arena", color: Colors.blueAccent),
                CategoryIcon(icon: Icons.emoji_events, label: "Zenith\nLeague", color: AppColors.redAccent),
                CategoryIcon(icon: Icons.shield, label: "Championship", color: Colors.white),
                Padding(

                  padding: EdgeInsets.only(top: 15.0,),
                  child: Icon(Icons.more_vert, color: AppColors.textGrey),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // 2. Tabs Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text("Esports", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.redAccent)),
                      const SizedBox(height: 4),
                      Container(height: 2, width: 40, color: AppColors.redAccent)
                    ],
                  ),
                  const SizedBox(width: 25),
                  const Text("Registered Matches", style: TextStyle(fontSize: 16, color: AppColors.textGrey)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // 3. Game Modes
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Game Modes", style: TextStyle(color: AppColors.textGrey, fontSize: 12)),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  GameModeCard(title: "Sniper", subtitle: "Ongoing Arena: 20", icon: Icons.gps_fixed, color: AppColors.neonGreen),
                  GameModeCard(title: "Assault", subtitle: "Ongoing Arena: 15", icon: Icons.landscape, color: AppColors.redAccent),
                ],
              ),
            ),
            const SizedBox(height: 25),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.cardBg,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    Expanded(child: _buildFilterBtn("SOLO", Icons.person, true)),
                    Expanded(child: _buildFilterBtn("DUO", Icons.group, false)),
                    Expanded(child: _buildFilterBtn("SQUAD", Icons.groups, false)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),


            SizedBox(
              height: 420,
              child: PageView.builder(
                controller: _pageController,
                itemCount: demoTournaments.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  return SlidingTournamentCard(
                      tournament: demoTournaments[index]
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.redAccent,
        unselectedItemColor: AppColors.textGrey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'esports'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }


  Widget _buildFilterBtn(String label, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(fontSize: 12, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? Colors.white : AppColors.textGrey)),
          const SizedBox(width: 8),
          Icon(icon, size: 16, color: isSelected ? Colors.white : AppColors.textGrey)
        ],
      ),
    );
  }
}