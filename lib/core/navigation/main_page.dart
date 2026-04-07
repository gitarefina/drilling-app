import 'package:drilling_app/core/navigation/navigation_cubit.dart';
import 'package:drilling_app/core/navigation/navigation_state.dart';
import 'package:drilling_app/features/homepage/presentation/home_page_draft.dart';
import 'package:drilling_app/features/homepage/presentation/home_page_submit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushNamed('drilling');
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            bottom: TabBar(
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(
                    context,
                  ).getNavbarItem(NavbarItem.home);
                }
                if (index == 1) {
                  BlocProvider.of<NavigationCubit>(
                    context,
                  ).getNavbarItem(NavbarItem.history);
                }
              },

              controller: _tabController,
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'History'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  if (state.item == NavbarItem.home) {
                    return HomePageSubmit();
                  }
                  if (state.item == NavbarItem.history) {
                    return HomePageDraft();
                  }

                  return Container();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
