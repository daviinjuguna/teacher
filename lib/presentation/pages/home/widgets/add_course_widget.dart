import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/di/injection.dart';
import 'package:teacher/presentation/bloc/file_to_url/file_from_url_bloc.dart';
import 'package:teacher/presentation/bloc/picker/picker_bloc.dart';

import 'add_course_object.dart';

class AddCourseWidget extends StatefulWidget {
  const AddCourseWidget(
      {Key? key,
      String? initTitle,
      String? initDesc,
      String? initPic,
      required String title})
      : _initTitle = initTitle,
        _initDesc = initDesc,
        _initPic = initPic,
        _title = title,
        super(key: key);

  final String? _initTitle;
  final String? _initDesc;
  final String? _initPic;
  final String _title;
  @override
  _AddCourseWidgetState createState() => _AddCourseWidgetState();
}

class _AddCourseWidgetState extends State<AddCourseWidget> {
  final _fileFromUrl = getIt<FileFromUrlBloc>();
  final _pickerBloc = getIt<PickerBloc>();

  File? _image;
  String? _imageUrl;
  String? _desc;
  String? _title;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget._initTitle);
    _descriptionController = TextEditingController(text: widget._initDesc);
    // _imageUrl = widget._initPic;
    if (widget._initPic != null) {
      _fileFromUrl.add(FileFromUrlEvent.started(url: widget._initPic!));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _fileFromUrl.close();
    _pickerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _fileFromUrl),
        BlocProvider(create: (context) => _pickerBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FileFromUrlBloc, FileFromUrlState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  _image = state.file;
                },
              );
            },
          ),
          BlocListener<PickerBloc, PickerState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  _imageUrl = state.file;
                  _image = File(state.file);
                },
              );
            },
          )
        ],
        child: AlertDialog(
          scrollable: true,
          title: Text(widget._title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<FileFromUrlBloc, FileFromUrlState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => BlocBuilder<PickerBloc, PickerState>(
                        builder: (context, state) {
                      return GestureDetector(
                        onTap: () => _showPicker(context),
                        child: Container(
                          // radius: 60,.
                          color: Colors.white,
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _image!,
                                    width: 220,
                                    height: 115,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: kBlackColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 220,
                                  height: 115,
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      );
                    }),
                    loading: (value) => Container(
                      decoration: BoxDecoration(
                        color: kBlackColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 220,
                      height: 115,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
                controller: _titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: "Enter Title",
                ),
                onChanged: (value) {
                  _title = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontWeight: FontWeight.w300),
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter Description",
                ),
                onChanged: (value) {
                  _desc = value;
                },
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: Text(
                "CANCEL",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () => {
                if (widget._title == "ADD COURSE")
                  {
                    if (_titleController.text.isEmpty ||
                        _descriptionController.text.isEmpty ||
                        _imageUrl == null)
                      {
                        ScaffoldMessenger.maybeOf(context)
                          ?..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.fixed,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              )),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "ERROR",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // SizedBox(height: 3),
                                  Text("Fill all values")
                                ],
                              ),
                            ),
                          )
                      }
                    else
                      {
                        Navigator.of(context).pop(
                          AddCourseObject(
                            desc: _desc,
                            imgUrl: _imageUrl,
                            title: _title,
                          ),
                        ),
                      }
                  }
                else
                  {
                    if (_titleController.text.isEmpty ||
                        _descriptionController.text.isEmpty)
                      {
                        ScaffoldMessenger.maybeOf(context)
                          ?..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.fixed,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              )),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "ERROR",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // SizedBox(height: 3),
                                  Text("Fill all values")
                                ],
                              ),
                            ),
                          )
                      }
                    else
                      {
                        Navigator.of(context).pop(
                          AddCourseObject(
                            desc: _desc,
                            imgUrl: _imageUrl,
                            title: _title,
                          ),
                        ),
                      }
                  },
              },
              child: Text(
                "SUBMIT",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      // _imgFromGallery();
                      _pickerBloc
                          .add(PickerEvent.pickImage(imageLocation: "Gallery"));
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    // _imgFromCamera();
                    _pickerBloc
                        .add(PickerEvent.pickImage(imageLocation: "Camera"));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
