import 'package:flutter/material.dart';
import 'package:torliga_app/presentation/pages/home/fragments/home_fragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = List.filled(5, Placeholder());

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomeFragment();
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_pages[0] is Placeholder) {
      _pages[0] = _buildPage(0);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: IndexedStack(
        index: 0,
        children: _pages.map((page) => page).toList(),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, true),
              _buildNavItem(Icons.sports_soccer, false),
              _buildNavItem(Icons.emoji_events_outlined, false),
              _buildNavItem(Icons.grid_view, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFCDFF00) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.black : Colors.grey[400],
        size: 28,
      ),
    );
  }
}