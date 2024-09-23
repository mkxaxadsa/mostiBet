import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(
            title: 'SETTINGS',
            back: true,
          ),
          const SizedBox(height: 40),
          _Tile(
            'Share with friends',
            onPressed: () {
              Share.share('Check out this awesome app!');
            },
          ),
          const SizedBox(height: 27),
          _Tile(
            'Write support',
            onPressed: () {
              launchUrl(Uri.parse(''));
            },
          ),
          const SizedBox(height: 27),
          _Tile(
            'Terms of use',
            onPressed: () {
              launchUrl(Uri.parse(''));
            },
          ),
          const SizedBox(height: 27),
          _Tile(
            'Privacy Policy',
            onPressed: () {
              launchUrl(Uri.parse(''));
            },
          ),
          const SizedBox(height: 27),
        ],
      ),
    );
  }

  void _shareApp(BuildContext context) async {
    await Share.share(
      'Download and write your matches with us - Mosti Match Play in AppStore!',
      subject: 'Check out Mosti Match Play!',
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.title, {required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        minSize: 45,
        child: Row(
          children: [
            const SizedBox(width: 24),
            const Spacer(),
            TextM(title, fontSize: 20),
            const Spacer(),
            SvgPicture.asset('assets/chevron.svg'),
            const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }
}
