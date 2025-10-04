import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int _selectedDayIndex = 2; // Today is selected

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Top Stats Bar
          _buildTopStatsBar(),

          // Date Selector
          _buildDateSelector(),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // My Favorite Club Card
                  _buildFavoriteClubCard(),

                  const SizedBox(height: 24),

                  // Leagues List
                  _buildLeaguesList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopStatsBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: SvgPicture.asset('assets/svg/calendar.svg', width: 20, height: 20, ),
            ),
          ),
          Column(
            children: [
              Text(
                "0",
                style: TextStyle(
                    color: Color(0xFFCDFF00),
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),
              ),
              Text(
                "Points",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFCDFF00),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        'TC',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
                        ),
                        child: const Text(
                          '12 th',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "15",
                style: TextStyle(
                    color: Color(0xFFCDFF00),
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),
              ),
              Text(
                "Coins",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800], // dark background (like your screenshot)
              borderRadius: BorderRadius.circular(18), // rounded square
            ),
            child: Center(
              child: SvgPicture.asset('assets/svg/basket.svg', width: 20, height: 20, ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    final dates = [
      {'day': 'Tue', 'date': '30 Jan'},
      {'day': 'Yesterday', 'date': '31 Jan'},
      {'day': 'Today', 'date': '01 Feb'},
      {'day': 'Tomorrow', 'date': '02 Feb'},
      {'day': 'Sat', 'date': '03 Feb'},
    ];

    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          final isSelected = index == _selectedDayIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedDayIndex = index),
            child: Container(
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF2A2A2A) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? const Color(0xFFCDFF00) : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dates[index]['day']!,
                    style: TextStyle(
                      color: isSelected ? const Color(0xFFCDFF00) : Colors.grey[300],
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dates[index]['date']!,
                    style: TextStyle(
                      color: isSelected ? const Color(0xFFCDFF00) : Colors.grey[400],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFavoriteClubCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF2A4A2A),
            const Color(0xFF1A3A1A),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: const Color(0xFFCDFF00), size: 24),
              const SizedBox(width: 8),
              const Text(
                'My Favorite Club',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTeamLogo('assets/real_madrid.png', 'Real Madrid'),
              Column(
                children: [
                  const Text(
                    '20:30',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              _buildTeamLogo('assets/barcelona.png', 'Barcelona'),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A2A2A),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Predict Now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamLogo(String asset, String name) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.sports_soccer, size: 40, color: Colors.grey[800]),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildLeaguesList() {
    return Column(
      children: [
        _buildLeagueSection(
          'Spain - LaLiga',
          Icons.flag,
          Colors.red,
          [
            {'home': 'Valencia', 'away': 'Athletic Club', 'score': '1 - 0', 'time': ''},
            {'home': 'Celta Vigo', 'away': 'Real Sociedad', 'score': '', 'time': '23:30'},
            {'home': 'Osasuna', 'away': 'Getafe', 'score': '', 'time': '23:30'},
            {'home': 'Real Madrid', 'away': 'Almeria', 'score': '', 'time': '23:30'},
          ],
        ),
        const SizedBox(height: 16),
        _buildLeagueSection(
          'England - Premier League',
          Icons.flag,
          Colors.blue,
          [
            {'home': 'Brentford', 'away': 'Nottingham Fore...', 'score': '', 'time': '10:00'},
            {'home': 'Sheffield United', 'away': 'West Ham United', 'score': '', 'time': '16:45'},
            {'home': 'AFC Bournemou...', 'away': 'Liverpool', 'score': '', 'time': '23:30'},
          ],
        ),
      ],
    );
  }

  Widget _buildLeagueSection(String title, IconData icon, Color color, List<Map<String, String>> matches) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[400], size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...matches.map((match) => _buildMatchRow(match)).toList(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCDFF00),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Predict Now',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchRow(Map<String, String> match) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[800]!, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          _buildTeamIcon(),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              match['home']!,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          if (match['score']!.isNotEmpty)
            Text(
              match['score']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (match['time']!.isNotEmpty)
            Text(
              match['time']!,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
          const SizedBox(width: 12),
          _buildTeamIcon(),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              match['away']!,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamIcon() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.sports_soccer, size: 20, color: Colors.grey[600]),
    );
  }
}
