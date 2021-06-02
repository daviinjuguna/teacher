import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/di/injection.dart';
import 'package:teacher/presentation/bloc/file_to_url/file_from_url_bloc.dart';
import 'package:teacher/presentation/bloc/picker/picker_bloc.dart';
import 'package:teacher/presentation/pages/course/widgets/add_pdf_object.dart';

class AddPdfDialog extends StatefulWidget {
  final String? _initTitle;
  final String? _initPdf;
  final bool _isAdd;
  const AddPdfDialog(
      {Key? key, String? initTitle, String? initPdf, bool isAdd = true})
      : _initTitle = initTitle,
        _initPdf = initPdf,
        _isAdd = isAdd,
        super(key: key);

  @override
  _AddPdfDialogState createState() => _AddPdfDialogState();
}

class _AddPdfDialogState extends State<AddPdfDialog> {
  final _fileFromUrl = getIt<FileFromUrlBloc>();
  final _pickerBloc = getIt<PickerBloc>();

  TextEditingController _titleController = TextEditingController();
  String? _title;
  String? _pdf;
  File? _pdfDoc;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget._initTitle);

    if (widget._initPdf != null) {
      _fileFromUrl.add(FileFromUrlEvent.started(url: widget._initPdf!));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
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
                  _pdfDoc = state.file;
                },
              );
            },
          ),
          BlocListener<PickerBloc, PickerState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  _pdf = state.file;
                  _pdfDoc = File(state.file);
                },
              );
            },
          )
        ],
        child: AlertDialog(
          title: widget._isAdd ? Text("ADD PDF") : Text("EDIT PDF"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              SizedBox(height: 5),
              Card(
                margin: EdgeInsets.zero,
                color: Colors.grey[100],
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<FileFromUrlBloc, FileFromUrlState>(
                          builder: (context, state) {
                            return state.maybeMap(
                              loading: (value) => Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(kBlackColor),
                                ),
                              ),
                              orElse: () =>
                                  BlocBuilder<PickerBloc, PickerState>(
                                builder: (context, state) {
                                  return _pdfDoc != null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("View"),
                                            IconButton(
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        PDF().fromPath(
                                                  _pdfDoc!.path,
                                                ),
                                              ),
                                              icon: Icon(Icons.picture_as_pdf),
                                            ),
                                          ],
                                        )
                                      : Text("None Selected");
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            _pickerBloc.add(PickerEvent.pickFile()),
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                              TextStyle(color: Colors.white),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              kBlackColor,
                            )),
                        child: Text(
                          "Select",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text("Selct Only PDF")
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
                if (widget._isAdd)
                  {
                    if (_titleController.text.isEmpty || _pdf == null)
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
                        Navigator.of(context).pop(AddPdfObject(
                          title: _title,
                          pdf: _pdf,
                        ))
                      }
                  }
                else
                  {
                    if (_titleController.text.isEmpty)
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
                        Navigator.of(context).pop(AddPdfObject(
                          title: _title,
                          pdf: _pdf,
                        ))
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
            ),
          ],
        ),
      ),
    );
  }
}
