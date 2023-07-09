import 'package:codeunion/favorite/favorite.dart';
import 'package:codeunion/feed/feed.dart';
import 'package:codeunion/home/cubit/home_cubit.dart';
import 'package:codeunion/l10n/l10n.dart';
import 'package:codeunion/map/map.dart';
import 'package:codeunion/profile/profile.dart';
import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This class is a stateless widget that displays the tabs for the home page.
/// It uses the `BlocBuilder` widget to listen to the state of the [HomeCubit]
/// and update the tabs accordingly.
class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    final themeIcon = Theme.of(context).icons;
    final l10 = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10.profile)),
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          FeedView(),
          MapView(),
          FavoriteView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: const Key('home_BottomNavigationBar'),
        type: BottomNavigationBarType.fixed, // Fixed
        currentIndex: selectedTab.index,
        onTap: (index) {
          context.read<HomeCubit>().setTab(
                HomeTab.values[index],
              );
        },
        backgroundColor: CODEUNIONColors.white,
        items: [
          BottomNavigationBarItem(
            icon: themeIcon.feedIcon(
              size: 18.h,
              color: selectedTab.index == 0 ? CODEUNIONColors.purple : null,
            ),
            label: l10.feed,
          ),
          BottomNavigationBarItem(
            icon: themeIcon.mapIcon(
              size: 18.h,
              color: selectedTab.index == 1 ? CODEUNIONColors.purple : null,
            ),
            label: l10.map,
          ),
          BottomNavigationBarItem(
            icon: themeIcon.favoriteIcon(
              size: 18.h,
              color: selectedTab.index == 2 ? CODEUNIONColors.purple : null,
            ),
            label: l10.favorite,
          ),
          BottomNavigationBarItem(
            icon: themeIcon.profileIcon(
              size: 18.h,
              color: selectedTab.index == 3 ? CODEUNIONColors.purple : null,
            ),
            label: l10.profile,
          ),
        ],
      ),
    );
  }
}
