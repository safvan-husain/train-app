import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/sub_screens/widgets/find_train_input_fiealds.dart';
import 'package:train_app/screens/home/sub_screens/widgets/train_list_result.dart';

class BookTicketScreen extends StatefulWidget {
  const BookTicketScreen({
    super.key,
  });

  @override
  State<BookTicketScreen> createState() => _BookTicketScreenState();
}

class _BookTicketScreenState extends State<BookTicketScreen>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (context.read<HomeBloc>().state.isOnResult) {
          context.read<HomeBloc>().add(CancelTrainResult());
          return false;
        }
        return true;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: context.read<HomeBloc>().state.isOnResult
                ? const TrainListResult()
                : const SingleChildScrollView(
                    child: FindTrainsFieald(),
                  ),
          );
        },
      ),
    );
  }
}
