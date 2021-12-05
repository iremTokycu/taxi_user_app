
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'konum.dart';



const appName = 'Rezervasyon Ekranı';

void main() => runApp(DatePicker());

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: DatePickerPage(),
      theme: ThemeData.light().copyWith(
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder())),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Spanish
        const Locale('fr'), // French
        const Locale('zh'), // Chinese
      ],
    );
  }
}

class DatePickerPage extends StatefulWidget {
  @override
  DatePickerPageState createState() => DatePickerPageState();
}

class DatePickerPageState extends State<DatePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(appName)),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: DateTimeForm())),
        ));
  }
}

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ComplexDateTimeField(),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                    hintText: "Adınızı Giriniz", labelText: "Adınız-Soyadınız"),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                    hintText: "Telefon Numarası",
                    labelText: "Telefon Numaranızı Giriniz"),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                    hintText: "Adres", labelText: "Mevcut Konum Adresi"),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                    hintText: "Adres", labelText: "Varış Noktası Adresi"),
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 90,
                  height: 40,
                  child: RaisedButton(
                    child: Text(
                      "Kaydet",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
                      print('enter');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapScreen()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComplexDateTimeField extends StatefulWidget {
  @override
  _ComplexDateTimeFieldState createState() => _ComplexDateTimeFieldState();
}

class _ComplexDateTimeFieldState extends State<ComplexDateTimeField> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final initialValue = DateTime.now();

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  bool readOnly = true;
  bool showResetIcon = true;
  DateTime value = DateTime.now();
  int changedCount = 0;
  int savedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
            'Rezerve Edeceğiniz Tarih ve Saati Seçiniz (${format.pattern})'),
      ),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
        autovalidateMode: autoValidateMode,
        validator: (date) => date == null ? 'Invalid date' : null,
        initialValue: initialValue,
        onChanged: (date) => setState(() {
          value = date;
          changedCount++;
        }),
        onSaved: (date) => setState(() {
          value = date;
          savedCount++;
        }),
        resetIcon: showResetIcon ? Icon(Icons.delete) : null,
        readOnly: readOnly,
        decoration: InputDecoration(
            helperText: 'Changed: $changedCount, Saved: $savedCount, $value'),
      ),
    ]);
  }
}
