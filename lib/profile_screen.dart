import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color cream = Color(0xFFFFFCF5);
  static const Color blue = Color(0xFF174C9C);
  static const Color purple = Color(0xFF8950F5);

  String userName = 'Esha';
  int selectedNav = 4;

  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.person_outline_rounded,
      'title': 'Edit Profile',
      'subtitle': 'Update your name and avatar',
      'color': Color(0xFFAA91FF),
      'background': Color(0xFFECE4FF),
    },
    {
      'icon': Icons.settings_outlined,
      'title': 'App Settings',
      'subtitle': 'Theme, notifications and more',
      'color': Color(0xFFFF6BA6),
      'background': Color(0xFFFFE0EC),
    },
    {
      'icon': Icons.favorite_border_rounded,
      'title': 'My Favorites',
      'subtitle': 'View your saved drawings',
      'color': Color(0xFFFFAE35),
      'background': Color(0xFFFFF0CE),
    },
    {
      'icon': Icons.shield_outlined,
      'title': 'My Badges',
      'subtitle': 'See your achievements',
      'color': Color(0xFF35B879),
      'background': Color(0xFFD8F9E5),
    },
    {
      'icon': Icons.help_outline_rounded,
      'title': 'Help & Support',
      'subtitle': 'Get help or send feedback',
      'color': Color(0xFF35A8ED),
      'background': Color(0xFFDDF2FF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 15),
                child: Column(
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildProfileCard(),
                    const SizedBox(height: 15),
                    _buildStatistics(),
                    const SizedBox(height: 18),
                    _buildMenu(),
                    const SizedBox(height: 15),
                    _buildLogoutButton(),
                  ],
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFDCC5FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: blue,
              size: 27,
            ),
          ),
        ),
        const Expanded(
          child: Column(
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 39,
                  fontWeight: FontWeight.w900,
                  color: blue,
                ),
              ),
              Text(
                'Your little art world!',
                style: TextStyle(
                  fontSize: 15,
                  color: blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Text(
          '🐼',
          style: TextStyle(fontSize: 48),
        ),
      ],
    );
  }

  // Profile card
  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EDFF),
        borderRadius: BorderRadius.circular(27),
        border: Border.all(
          color: const Color(0xFFE9DAFF),
        ),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFDCCAFF),
                  border: Border.all(
                    color: purple,
                    width: 4,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '👧🏻',
                    style: TextStyle(fontSize: 65),
                  ),
                ),
              ),
              Positioned(
                right: -5,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Avatar selection will be added soon!',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: purple,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 17),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: blue,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Text('⭐', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 7),
                    Flexible(
                      child: Text(
                        'Little Artist',
                        style: TextStyle(
                          fontSize: 16,
                          color: blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                const Text(
                  '💜 Create  •  Draw  •  Be Happy 💜',
                  style: TextStyle(
                    fontSize: 11,
                    color: blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Statistics cards
  Widget _buildStatistics() {
    final stats = [
      {
        'icon': '🎨',
        'number': '12',
        'label': 'Drawings',
        'color': Color(0xFFFFE5EF),
        'border': Color(0xFFFFC2DA),
      },
      {
        'icon': '⭐',
        'number': '5',
        'label': 'Favorites',
        'color': Color(0xFFE1F4FF),
        'border': Color(0xFFB4E6FF),
      },
      {
        'icon': '🏆',
        'number': '3',
        'label': 'Badges',
        'color': Color(0xFFE4F9E5),
        'border': Color(0xFFB9EDC0),
      },
      {
        'icon': '💗',
        'number': '1',
        'label': 'Day Streak',
        'color': Color(0xFFF0E9FF),
        'border': Color(0xFFDDCEFF),
      },
    ];

    return Row(
      children: stats.map((stat) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 2,
            ),
            decoration: BoxDecoration(
              color: stat['color'] as Color,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: stat['border'] as Color,
              ),
            ),
            child: Column(
              children: [
                Text(
                  stat['icon'] as String,
                  style: const TextStyle(fontSize: 31),
                ),
                const SizedBox(height: 5),
                Text(
                  stat['number'] as String,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: blue,
                  ),
                ),
                const SizedBox(height: 3),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    stat['label'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // Menu options
  Widget _buildMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(27),
        border: Border.all(
          color: const Color(0xFFDCE7FF),
        ),
      ),
      child: Column(
        children: List.generate(menuItems.length, (index) {
          final item = menuItems[index];

          return Column(
            children: [
              InkWell(
                onTap: () => _openMenu(index),
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 57,
                        width: 57,
                        decoration: BoxDecoration(
                          color: item['background'] as Color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: (item['color'] as Color)
                                .withOpacity(0.25),
                          ),
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          size: 30,
                          color: item['color'] as Color,
                        ),
                      ),

                      const SizedBox(width: 13),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['subtitle'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6885B6),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF7587B1),
                        size: 27,
                      ),
                    ],
                  ),
                ),
              ),

              if (index != menuItems.length - 1)
                const Divider(
                  height: 1,
                  color: Color(0xFFEAF0FA),
                ),
            ],
          );
        }),
      ),
    );
  }

  // Menu actions
  void _openMenu(int index) {
    switch (index) {
      case 0:
        _editProfile();
        break;
      case 1:
        _showSettings();
        break;
      case 2:
        _showInfo(
          'My Favorites',
          'Your saved drawings and favorite artworks will appear here.',
          '❤️',
        );
        break;
      case 3:
        _showInfo(
          'My Badges',
          'Keep drawing and completing challenges to earn more badges!',
          '🏆',
        );
        break;
      case 4:
        _showInfo(
          'Help & Support',
          'Need help? Ask a parent or guardian for support.',
          '💬',
        );
        break;
    }
  }

  // Edit profile
  Future<void> _editProfile() async {
    final controller = TextEditingController(text: userName);

    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: TextField(
            controller: controller,
            maxLength: 20,
            decoration: const InputDecoration(
              labelText: 'Your Name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, controller.text.trim());
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (result != null && result.isNotEmpty) {
      setState(() {
        userName = result;
      });
    }
  }

  // Settings
  void _showSettings() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('App Settings ⚙️'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Sound Effects'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Notifications'),
                value: true,
                onChanged: (value) {},
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('App Theme'),
                subtitle: Text('Pastel Theme'),
                leading: Icon(Icons.palette_outlined),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  // Information dialog
  void _showInfo(String title, String message, String emoji) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
          title: Text(
            '$emoji $title',
            style: const TextStyle(color: blue),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Logout
  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 57,
      child: OutlinedButton.icon(
        onPressed: _logout,
        icon: const Icon(
          Icons.logout_rounded,
          color: purple,
          size: 25,
        ),
        label: const Text(
          'Logout',
          style: TextStyle(
            fontSize: 19,
            color: purple,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFF4E5FF),
          side: const BorderSide(
            color: Color(0xFFDCC2FF),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout?'),
          content: const Text(
            'Are you sure you want to leave your art world?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Stay'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Logout action will be connected later.',
                    ),
                  ),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // Bottom navigation
  Widget _buildBottomNavigation() {
    final icons = [
      Icons.home_outlined,
      Icons.grid_view_rounded,
      Icons.image_outlined,
      Icons.emoji_events_outlined,
      Icons.person_outline_rounded,
    ];

    final labels = [
      'Home',
      'Categories',
      'Gallery',
      'Challenges',
      'Profile',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Row(
        children: List.generate(icons.length, (index) {
          final selected = selectedNav == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedNav = index;
                });

                if (index != 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${labels[index]} screen will be connected later.',
                      ),
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFFF0E8FF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      size: 26,
                      color: selected
                          ? purple
                          : const Color(0xFF8190B4),
                    ),
                    const SizedBox(height: 4),
                    FittedBox(
                      child: Text(
                        labels[index],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: selected
                              ? purple
                              : const Color(0xFF8190B4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}