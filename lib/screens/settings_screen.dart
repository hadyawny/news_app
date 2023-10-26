import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';
import '../shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "SettingsScreen";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> items = [
    'English',
    'العربيه',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);


    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: primary,
          title: Text(AppLocalizations.of(context)!.settings),
          centerTitle: true,
          elevation: 0.0,
          shape: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(AppLocalizations.of(context)!.language, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Choose',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;

                          if(selectedValue=='English'){
                            provider.changeLanguage("en");
                          }
                          else if(selectedValue=='العربيه'){
                            provider.changeLanguage("ar");
                          }
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
