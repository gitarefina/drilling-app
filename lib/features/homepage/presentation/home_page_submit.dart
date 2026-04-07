import 'package:drilling_app/features/drilling/bloc/drilling_bloc.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_event.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrillingBloc,DrillingState>(builder:(context, state) {
    
     return Container();
    }, listener:(context, state) {
      
    },);
  }
}
