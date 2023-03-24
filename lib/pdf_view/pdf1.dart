import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_builder/resumeDataModal.dart';
import 'package:printing/printing.dart';

Future<void> createPDF(ResumeModal rm) async {
  var pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(20),
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      build: (context) {
        return pw.Container(
          child: pw.Padding(
            padding: pw.EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    "RESUME",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 26,
                        letterSpacing: 2),
                  ),
                ),
                pw.Divider(color: PdfColors.blue.shade(50), thickness: 2),
                pw.Row(
                  children: [
                    // pw.Container(height: 150,width: 150,
                    //     child: pw.Image(rm.u_path),
                    //     decoration: pw.BoxDecoration(shape: pw.BoxShape.circle)),
                    pw.Padding(
                      padding: pw.EdgeInsets.all(10.0),
                      child: pw.Container(
                        height: 170,
                        width: 150,
                        color: PdfColors.black,
                        child: pw.Image(pw.MemoryImage(File("${rm.u_path}").readAsBytesSync()),fit: pw.BoxFit.fill),
                      ),
                    ),


                    // CircleAvatar(
                    //     radius: 75,
                    //     backgroundImage:
                    //       File("${rm.u_path}"),
                    //     ),
                    pw.Container(
                      height: 150,
                      child: pw.Padding(
                        padding: pw.EdgeInsets.only(left: 15.0),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("${rm.u_name}",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blue)),
                            pw.Text("${rm.u_address}",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.Text("${rm.u_contact}",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.Text("${rm.u_email}",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blue))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                TitleBox("Career Objective"),
                pw.Text("${rm.u_career}",
                    textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(fontSize: 12)),
                TitleBox("Education Qualification"),
                pw.Text("${rm.u_education} ",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(fontSize: 12)),
                TitleBox("Projects"),
                pw.Text("${rm.u_project}",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold)),
                pw.Text("${rm.u_project_details}",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(fontSize: 12)),
                TitleBox("Training"),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("${rm.u_training_place}",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold)),
                    pw.Text("${rm.u_training_year}",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold))
                  ],
                ),
                TitleBox("Technical Skills"),
                pw.Text(
                  "${rm.u_tech_skills}",
                  style: pw.TextStyle(fontSize: 12),
                ),
                TitleBox("Skills"),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: rm.u_skill!.map((e) => lakhan(e)).toList()),
                TitleBox("Expected Salary"),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "${rm.rangevalue!.start} -  ${rm.rangevalue!.end}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    )
                  ],
                ),
                TitleBox("Soft Skills"),
                pw.Text(
                  "${rm.u_soft_skills}",
                  style: pw.TextStyle(fontSize: 12),
                ),
                TitleBox("References"),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_ref}    ",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                        )),
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_refjob}    ",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                        )),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_refcompany}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_refemail}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ],
                ),
                TitleBox("Declaration"),
                pw.Text(
                    "I hereby inform you all the statement made above are true, best of my knowledge and belief."),
                pw.Container(
                  height: 15,
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text("${rm.u_name}",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15)),
                )
              ],
            ),
          ),
        );
      },
    ),
  );



  Directory? directory = await getExternalStorageDirectory();
  File file = File("${directory!.path}/flutter.pdf");
  print("${directory!.path}/flutter.pdf");
  await file.writeAsBytes(await pdf.save());
}

Future<Uint8List> savePDF(ResumeModal rm) async {
  var pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(20),
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      build: (context) {
        return pw.Container(
          child: pw.Padding(
            padding: pw.EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    "RESUME",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 26,
                        letterSpacing: 2),
                  ),
                ),
                pw.Divider(color: PdfColors.blue.shade(50), thickness: 2),
                pw.Row(
                  children: [
                    // pw.Container(height: 150,width: 150,
                    //     child: pw.Image(rm.u_path),
                    //     decoration: pw.BoxDecoration(shape: pw.BoxShape.circle)),
                    pw.Padding(
                      padding: pw.EdgeInsets.all(10.0),
                      child: pw.Container(
                        height: 170,
                        width: 150,
                        color: PdfColors.black,
                        child: pw.Image(pw.MemoryImage(File("${rm.u_path}").readAsBytesSync()),fit: pw.BoxFit.fill),
                      ),
                    ),


                    // CircleAvatar(
                    //     radius: 75,
                    //     backgroundImage:
                    //       File("${rm.u_path}"),
                    //     ),
                    pw.Container(
                      height: 150,
                      child: pw.Padding(
                        padding: pw.EdgeInsets.only(left: 15.0),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("${rm.u_name}",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blue)),
                            pw.Text("${rm.u_address}",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.Text("${rm.u_contact}",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.Text("${rm.u_email}",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blue))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                TitleBox("Career Objective"),
                pw.Text("${rm.u_career}",
                    textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(fontSize: 12)),
                TitleBox("Education Qualification"),
                pw.Text("${rm.u_education} ",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(fontSize: 12)),
                TitleBox("Projects"),
                pw.Text("${rm.u_project}",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold)),
                pw.Text("${rm.u_project_details}",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(fontSize: 12)),
                TitleBox("Training"),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("${rm.u_training_place}",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold)),
                    pw.Text("${rm.u_training_year}",
                        textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold))
                  ],
                ),
                TitleBox("Technical Skills"),
                pw.Text(
                  "${rm.u_tech_skills}",
                  style: pw.TextStyle(fontSize: 12),
                ),
                TitleBox("Skills"),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: rm.u_skill!.map((e) => lakhan(e)).toList()),
                TitleBox("Expected Salary"),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "${rm.rangevalue!.start} -  ${rm.rangevalue!.end}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    )
                  ],
                ),
                TitleBox("Soft Skills"),
                pw.Text(
                  "${rm.u_soft_skills}",
                  style: pw.TextStyle(fontSize: 12),
                ),
                TitleBox("References"),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_ref}    ",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                        )),
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_refjob}    ",
                          style: pw.TextStyle(
                              fontSize: 15, fontWeight: pw.FontWeight.bold),
                        )),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_refcompany}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                    pw.Container(
                        width: 180,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          "${rm.u_refemail}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ],
                ),
                TitleBox("Declaration"),
                pw.Text(
                    "I hereby inform you all the statement made above are true, best of my knowledge and belief."),
                pw.Container(
                  height: 15,
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text("${rm.u_name}",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15)),
                )
              ],
            ),
          ),
        );
      },
    ),
  );




  return await pdf.save();
}
pw.Widget TitleBox(String titlename) {
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(vertical: 8.0),
    child: pw.Container(
      height: 30,
      alignment: pw.Alignment.centerLeft,
      decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.all(
            pw.Radius.circular(5),
          ),
          border: pw.Border.all(width: 1)),
      child: pw.Padding(
        padding: pw.EdgeInsets.symmetric(horizontal: 8.0),
        child: pw.Text("$titlename",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
      ),
    ),
  );
}

pw.Widget lakhan(String sk)
{
  return pw.Text("₹ $sk");
}