import 'package:drilling_app/features/drilling/bloc/drilling_bloc.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_event.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_state.dart';
import 'package:drilling_app/features/homepage/bloc_draft/home_bloc_draft.dart';
import 'package:drilling_app/features/homepage/bloc_draft/home_state_draft.dart';
import 'package:drilling_app/features/homepage/bloc_submit/home_bloc.dart';
import 'package:drilling_app/features/homepage/bloc_submit/home_event.dart';
import 'package:drilling_app/features/homepage/bloc_submit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageSubmit extends StatefulWidget {
  const HomePageSubmit({super.key});

  @override
  State<HomePageSubmit> createState() => _HomePageSubmitState();
}

class _HomePageSubmitState extends State<HomePageSubmit>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(getHistorySubmit());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,HomeState>(builder:(context, state) {
      if(state.status == HomeStatus.success){
        return ListView.builder(
          itemCount: state.model?.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                leading: Text(state.model?[index].id.toString() ?? ""),
                title: Text(state.model?[index].hole_id ?? ""),
                subtitle: Text(state.model?[index].created_time.toString() ?? ""),
                trailing: Text(state.model?[index].workflowStatus.toString() ?? ""),
              ),
            );

          },);
      }
      return Container();

    }, listener:(context, state) {
      print(" masuk ke listener");
      
    },);
  }
}
