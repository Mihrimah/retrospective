import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:retrospective/constant/constant.dart';
import 'package:retrospective/model/retro_data_model.dart';

class Mailer {
  final List<RetroDataModel> list;
  final String toAddress;
  int maxIndex;

  Mailer({@required this.list, @required this.toAddress});

  sendMail() async {
    String username = Constant.GMAIL_USERNAME;
    String password = Constant.GMAIL_PASSWORD;
    print("list " + list.length.toString());
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username)
      ..recipients.add(toAddress)
      ..subject =
          'Retrospective Output roomCode: ${list.first.roomCode} time: ${DateTime.now()}' //subject of the email
      ..html = generateHtml(list);

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' +
          sendReport.toString());
    } on MailerException catch (e) {
      print('Message failed: ' +
          e.toString());
      throw e;
    }
  }

  String generateHtml(List<RetroDataModel> list) {
    Table table = Table.createTable();
    Map<String, List<RetroDataModel>> map = groupBy(list);
    map.forEach((key, value) {
      Header header = Header(key);
      List<Row> rowList = List();
      value.forEach((element) {
        rowList.add(Row(text: element.textContent));
      });
      Block block = Block(header: header, rows: rowList);
      table.addBlock(block);
    });
    return table.generateHtml();
  }

  Map<String, List<RetroDataModel>> groupBy(List<RetroDataModel> list) {
    Map<String, List<RetroDataModel>> result = Map();
    for (RetroDataModel retro in list) {
      if (!result.containsKey(retro.templateTitle)) {
        List<RetroDataModel> newList = List();
        newList.add(retro);
        result.putIfAbsent(retro.templateTitle, () => newList);
      } else {
        List<RetroDataModel> currentList = result[retro.templateTitle];
        currentList.add(retro);
        result.update(retro.templateTitle, (value) => currentList);
      }
    }
    return result;
  }
}

class Table {
  List<Block> blocks;

  Table.createTable() {
    blocks = List();
  }

  addBlock(Block block) {
    blocks.add(block);
  }

  String generateHtml() {
    StringBuffer blocksHtml = StringBuffer();

    for (int i = 0; i < blocks.length; i++) {
      blocksHtml.write(blocks[i].generateBlockHtml());
    }

    String html = """<!DOCTYPE html>
        <html>
          <head>
          </head>
            <body>
              <div class="row">$blocksHtml</div>
            </body>
        </html>""";
    return html;
  }
}

class Block {
  Block({this.header, this.rows});

  final Header header;
  final List<Row> rows;

  String generateBlockHtml() {
    StringBuffer rowsHtml = StringBuffer();
    rows.forEach((element) {
      rowsHtml.write(element.generateRowHtml());
    });
    String html =
        """<div class="column">${header.generateHeaderHtml()}$rowsHtml</div>""";
    return html;
  }
}

class Row {
  Row({this.text});

  final String text;

  generateRowHtml() {
    StringBuffer html = StringBuffer();
    html.write("<p> $text </p>");
    return html;
  }
}

class Header extends Row {
  Header(val) : super(text: val);

  generateHeaderHtml() {
    StringBuffer html = StringBuffer();
    html.write("<h2> $text </h2>");
    return html;
  }
}
