import 'package:code_test_flutter/src/app/core/inject/modules/app_module.dart';
import 'package:code_test_flutter/src/features/photos/presentation/bloc/blocs/home_contract.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/widgets/home_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:code_test_flutter/src/features/photos/presentation/bloc/blocs/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = AppModule.bloc;
    bloc.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeData>(
      stream: bloc.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;
        return Scaffold(
          body: HomeContentWidget(data: data),
        );
      },
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
