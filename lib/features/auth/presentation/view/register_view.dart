import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // BatchEntity? _dropDownValue;
  // final List<CourseEntity> _lstCourseSelected = [];

  final _gap = const SizedBox(height: 8);

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Kiran');
  final _lnameController = TextEditingController(text: 'Rana');
  final _phoneController = TextEditingController(text: '9812345678');
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone No',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phoneNo';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  // BlocBuilder(
                  //   bloc: batchCubit,
                  //   builder: (context, state) {
                  //     final batchState = state as BatchState;
                  //     if (batchState.error != null) {
                  //       return Center(
                  //         child: Text(batchState.error!),
                  //       );
                  //     }

                  //     return batchState.isLoading
                  //         ? const Center(
                  //             child: CircularProgressIndicator(),
                  //           )
                  //         : DropdownButtonFormField(
                  //             items: batchState.batches
                  //                 .map((e) => DropdownMenuItem(
                  //                       value: e,
                  //                       child: Text(e.batchName),
                  //                     ))
                  //                 .toList(),
                  //             onChanged: (value) {
                  //               _dropDownValue = value;
                  //             },
                  //             value: _dropDownValue,
                  //             decoration: const InputDecoration(
                  //               labelText: 'Select batch',
                  //             ),
                  //           );
                  //   },
                  // ),
                  // _gap,
                  // BlocBuilder(
                  //   bloc: courseCubit,
                  //   builder: (context, state) {
                  //     final courseState = state as CourseState;
                  //     if (courseState.error != null) {
                  //       return Center(
                  //         child: Text(courseState.error!),
                  //       );
                  //     }

                  //     return state.isLoading
                  //         ? const CircularProgressIndicator()
                  //         : MultiSelectDialogField(
                  //             title: const Text('Select course'),
                  //             items: courseState.courses
                  //                 .map((course) => MultiSelectItem(
                  //                       course,
                  //                       course.courseName!,
                  //                     ))
                  //                 .toList(),
                  //             listType: MultiSelectListType.CHIP,
                  //             buttonText: const Text('Select course'),
                  //             buttonIcon: const Icon(Icons.search),
                  //             onConfirm: (values) {
                  //               _lstCourseSelected.clear();
                  //               _lstCourseSelected.addAll(values);
                  //             },
                  //             decoration: BoxDecoration(
                  //               border: Border.all(
                  //                 color: Colors.grey,
                  //               ),
                  //               borderRadius: BorderRadius.circular(5),
                  //             ),
                  //             validator: ((value) {
                  //               if (value == null || value.isEmpty) {
                  //                 return 'Please select course';
                  //               }
                  //               return null;
                  //             }),
                  //           );
                  //   },
                  // ),
                  _gap,
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {}
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
