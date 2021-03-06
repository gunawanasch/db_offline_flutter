import 'package:db_offline_flutter/bloc/contact/contact_bloc.dart';
import 'package:db_offline_flutter/bloc/contact/contact_event.dart';
import 'package:db_offline_flutter/bloc/contact/contact_state.dart';
import 'package:db_offline_flutter/library/colors.dart';
import 'package:db_offline_flutter/model/contact_model.dart';
import 'package:db_offline_flutter/repository/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with TickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final ContactBloc _contactBloc = ContactBloc(ContactRepository());
  List<ContactModel> _listContact = [];

  final InputDecoration _decoration = const InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: PrimaryDarkColor),
    ),
  );

  @override
  void initState() {
    super.initState();
    _contactBloc.add(GetAllContact());
  }

  Widget _nameTextField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: _decoration,
        controller: _nameController,
      ),
    );
  }

  Widget _phoneTextField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: _decoration,
        controller: _phoneController,
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget _addressTextField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: _decoration,
        controller: _addressController,
      ),
    );
  }

  Widget _saveButton(int? idContact) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: PrimaryColor,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          if (_nameController.text.trim().isEmpty || _phoneController.text.trim().isEmpty || _addressController.text.trim().isEmpty) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                content: Text("Please complete all field."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          } else {
            ContactModel contactModel = ContactModel();
            contactModel.name = _nameController.text.trim();
            contactModel.phone = _phoneController.text.trim();
            contactModel.address = _addressController.text.trim();
            Navigator.of(context).pop();
            if (idContact != null) {
              contactModel.idContact = idContact;
              _contactBloc.add(UpdateContact(contactModel: contactModel));
            } else {
              _contactBloc.add(AddContact(contactModel: contactModel));
            }
            // BlocProvider.of<ContactBloc>(context).add(AddContact(contactModel: contactModel));
          }
        },
        child: const Text("SAVE"),
      ),
    );
  }

  void _showFormContactBottomSheet(ContactModel? contactModel) async {
    if (contactModel != null) {
      setState(() {
        _nameController.text = contactModel.name!;
        _addressController.text = contactModel.address!;
        _phoneController.text = contactModel.phone!;
      });
    } else {
      setState(() {
        _nameController.text = "";
        _phoneController.text = "";
        _addressController.text = "";
      });
    }
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => SafeArea(
          child: SingleChildScrollView(
            child: AnimatedPadding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              duration: const Duration(milliseconds: 100),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name"),
                    _nameTextField(),
                    const SizedBox(height: 20),
                    const Text("Phone"),
                    _phoneTextField(),
                    const SizedBox(height: 20),
                    const Text("Address"),
                    _addressTextField(),
                    const SizedBox(height: 50),
                    _saveButton(contactModel?.idContact),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: BlocListener<ContactBloc, ContactState>(
            bloc: _contactBloc,
            listener: (context, state) {
              if (state is ContactInitial) {
                Center(child: CircularProgressIndicator());
              } else if (state is ContactLoading) {
                Center(child: CircularProgressIndicator());
              } else if (state is ContactSuccess) {
                _listContact = state.listContact;
                if (_listContact.isNotEmpty) {
                  ListView.builder(
                    itemCount: _listContact.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ContactRow(
                          contactModel: _listContact[index],
                          onPopupMenuSelected: (selectedMenuItem, model) {
                            if (selectedMenuItem == 0) {
                              _showFormContactBottomSheet(model);
                            } else {
                              _contactBloc.add(DeleteContact(idContact: model.idContact!));
                            }
                          },
                        ),
                  );
                } else {
                  Center(child: Text("Data is empty"));
                }
              } else if (state is ContactError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${state.message}")));
              }
            },
            child: BlocBuilder<ContactBloc, ContactState>(
              bloc: _contactBloc,
              builder: (context, state) {
                if (state is ContactInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ContactLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ContactSuccess) {
                  if (state.listContact.isNotEmpty) {
                    return ListView.builder(
                      itemCount: state.listContact.length,
                      itemBuilder: (BuildContext context, int index) =>
                        ContactRow(
                          contactModel: state.listContact[index],
                          onPopupMenuSelected: (selectedMenuItem, model) {
                            if (selectedMenuItem == 0) {
                              _showFormContactBottomSheet(model);
                            } else {
                              _contactBloc.add(DeleteContact(idContact: model.idContact!));
                            }
                          },
                        ),
                    );
                  } else {
                    return Center(child: Text("Data is empty"));
                  }
                } else if (state is ContactError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${state.message}")));
                }
                throw ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Error create widget")));
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormContactBottomSheet(null);
        },
        backgroundColor: PrimaryDarkColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
    _contactBloc.close();
  }
}

class ContactRow extends StatefulWidget {
  const ContactRow({Key? key, required this.contactModel, required this.onPopupMenuSelected}) : super(key: key);
  final ContactModel contactModel;
  final Function(int, ContactModel) onPopupMenuSelected;

  @override
  State<ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<ContactRow> {
  Future _showPopupMenu(BuildContext context, TapDownDetails details) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,),
      items: [
        const PopupMenuItem(
          child: Text("Edit"),
          value: 0,
        ),
        const PopupMenuItem(
          child: Text("Delete"),
          value: 1,
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      widget.onPopupMenuSelected(value!, widget.contactModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.contactModel.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.contactModel.phone!,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.contactModel.address!,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
            ),
            GestureDetector(
              onTapDown: (details) => _showPopupMenu(context, details),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/ic_three_dots.png",
                  width: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

