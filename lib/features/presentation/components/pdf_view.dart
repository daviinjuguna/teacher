import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/features/domain/entities/pdf.dart';

class PdfViewPage extends StatelessWidget {
  final Pdf? _pdf;
  final bool _fromUrl;
  final String? _path;

  const PdfViewPage({Key? key, Pdf? pdf, bool fromUrl = true, String? path})
      : _pdf = pdf,
        _path = path,
        _fromUrl = fromUrl,
        assert(
          fromUrl ? pdf != null : path != null,
        ),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: _pdf != null
            ? Text(
                "${_pdf?.name.trim().toUpperCase()}",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : Text(
                "PDF",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
      body: _fromUrl
          ? const PDF().fromUrl(
              "$FILE_URL${_pdf?.pdfDoc}",
              placeholder: (double progress) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Fetching pdf",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    CircularProgressIndicator(
                      value: progress / 100,
                      valueColor: AlwaysStoppedAnimation(kBlackColor),
                    )
                  ],
                ),
              ),
              errorWidget: (dynamic error) =>
                  Center(child: Text(error.toString())),
            )
          : PDF().fromPath(
              _path!,
            ),
    );
  }
}
