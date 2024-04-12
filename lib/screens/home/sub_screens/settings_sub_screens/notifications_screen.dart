import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/models/notification_model.dart';
import 'package:train_app/services/user_account_services.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<NotificationModel>> futureNotifications;
  @override
  void initState() {
    futureNotifications = UserAccountServices.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: futureNotifications,
            builder: (context, snp) {
              if (snp.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snp.hasData) {
                return Center(
                  child: Text(
                    "No notifications availible",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                );
              }
              return ListView.separated(
                itemCount: snp.data!.length,
                separatorBuilder: (context, index) => Divider(
                  color: Get.theme.splashColor,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      snp.data!.elementAt(index).title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    subtitle: Text(
                      snp.data!.elementAt(index).content,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 10,
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
