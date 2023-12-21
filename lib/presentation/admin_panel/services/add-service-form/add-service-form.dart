import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/add_service_form/add_service_from_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/core/widgets/radio_list_bottom_sheet.dart';

final addServiceKey = GlobalKey<FormState>();

class AddServiceForm extends StatefulWidget {
  @override
  _AddServiceFormState createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddServiceFromBloc>(
      create: (context) => getIt<AddServiceFromBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<AddServiceFromBloc, AddServiceFromState>(
              builder: (context, state) {
                AddServiceState currentState = state as AddServiceState;
                return Form(
                  key: addServiceKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            'Add Service',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.typeController,
                          decoration: InputDecoration(hintText: 'Type'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a title';
                            return null;
                          },
                          onChanged: (value) {
                            context.read<AddServiceFromBloc>().add(
                                  AddServiceTypeChanged(type: value),
                                );
                          },
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.descriptionController,
                          decoration: InputDecoration(hintText: 'Description'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a description';
                            return null;
                          },
                          onChanged: (value) {
                            context.read<AddServiceFromBloc>().add(
                                AddServiceDescriptionChanged(
                                    description: value));
                          },
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.numberController,
                          decoration: InputDecoration(hintText: 'Number'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert amount';
                            return null;
                          },
                          onChanged: (value) {
                            context
                                .read<AddServiceFromBloc>()
                                .add(AddServiceNumberChanged(number: value));
                          },
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) => {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.minCountController,
                          decoration: InputDecoration(hintText: 'Min count'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert min count';
                            return null;
                          },
                          onChanged: (value) {
                            context.read<AddServiceFromBloc>().add(
                                AddServiceMinCountChanged(minCount: value));
                          },
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) => {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.termsDayController,
                          decoration: InputDecoration(hintText: 'Term day'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert term day';
                            return null;
                          },
                          onChanged: (value) {
                            context
                                .read<AddServiceFromBloc>()
                                .add(AddServiceTermDayChanged(termDay: value));
                          },
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) => {},
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          String result = await radioListBottomSheet(
                              context: context,
                              options: [
                                'Yes',
                                'No',
                              ]);
                          if (result != null) {
                            bool isDefault = result == 'Yes' ? true : false;
                            context.read<AddServiceFromBloc>().add(
                                AddServiceIsDefaultChanged(
                                    isDefault: isDefault));
                          }
                        },
                        title: Text(
                          'Is service default?',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        subtitle: currentState.service.isDefault
                            ? Text('Yes')
                            : Text('No'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 12),
                              child: Text(
                                'Add service',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
