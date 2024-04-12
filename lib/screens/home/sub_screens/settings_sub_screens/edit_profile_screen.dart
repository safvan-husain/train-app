import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/models/user_model.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void initState() {
    UserModel user = UserController.instance.user.value!;
    _nameController.text = user.name;
    _emailController.text = user.email ?? '';
    _phoneController.text = user.phone ?? '';
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
          "Railway app",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: CircleAvatar(
                    radius: 60,
                  ),
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  label: Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  label: Text(
                    "Email",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  label: Text(
                    "Phone",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  HomeBloc.instance.add(EditProfileEvent(_nameController.text,
                      _phoneController.text, _emailController.text));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).focusColor,
                ),
                child: Text(
                  "Save",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
