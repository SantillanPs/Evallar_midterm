import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile header
              const _ProfileHeader(),
              const SizedBox(height: 24),

              // Settings sections
              _SettingsSection(
                title: 'Account',
                items: [
                  _SettingsItem(
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.credit_card,
                    title: 'Payment Methods',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.lock_outline,
                    title: 'Security',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _SettingsSection(
                title: 'Trading',
                items: [
                  _SettingsItem(
                    icon: Icons.history,
                    title: 'Order History',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.bar_chart,
                    title: 'Investment Reports',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.receipt_long,
                    title: 'Tax Documents',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _SettingsSection(
                title: 'Preferences',
                items: [
                  _SettingsItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.language,
                    title: 'Language',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'Appearance',
                    trailing: Switch(
                      value: Theme.of(context).brightness == Brightness.dark,
                      onChanged: (_) {},
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _SettingsSection(
                title: 'Support',
                items: [
                  _SettingsItem(
                    icon: Icons.help_outline,
                    title: 'Help Center',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.chat_bubble_outline,
                    title: 'Contact Support',
                    onTap: () {},
                  ),
                  _SettingsItem(
                    icon: Icons.policy_outlined,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage:
              NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
        ),
        const SizedBox(height: 16),
        const Text(
          'Alex Johnson',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'alex.johnson@example.com',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Edit Profile'),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Verify ID'),
            ),
          ],
        ),
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<_SettingsItem> items;

  const _SettingsSection({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              indent: 56,
            ),
            itemBuilder: (context, index) => items[index],
          ),
        ),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
