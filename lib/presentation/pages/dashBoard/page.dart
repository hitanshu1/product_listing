import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/constants.dart';

import '../../bloc/dashboard/bloc.dart';
import '../../bloc/dashboard/state.dart';
import 'bottomNavigationBar.dart';
import 'favourite/tab.dart';
import 'home/tab.dart';



/// dash board page
class DashBoardPage extends StatelessWidget {
  /// constructor
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppInfo.appName,
        ),
      ),
      body:
          BlocBuilder<DashBoardBloc, DashBoardState>(builder: (context, state) {
        return _body(state.pageIndex);
      }),
      bottomNavigationBar: const DashBoardNavigationBar(),
    );
  }

  Widget _body(int index) {
     if(index ==1){
      return const FavouriteTab();
    }
    return const HomeTab();
  }
}
