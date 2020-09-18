import 'package:gogame/locator.dart';
import 'package:gogame/models/dialog_models.dart';
import 'package:gogame/services/dialog_service.dart';
import 'package:gogame/services/localization_service.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/widgets/circular_button.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();
  LocalizationService _localizationService = locator<LocalizationService>();
  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
    _dialogService.registerLanguagePickerListener(_showLanguagePicker);
    _dialogService.registerCustomDialogListener(_showCutomDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),*/
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: buildChild(context, request),
            ));
  }

  void _showCutomDialog(Widget child) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),*/
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: child,
            ));
  }

  void _showLanguagePicker() {
    var langs = _localizationService.languages;

    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            //width: SizeConfig.screenWidth,
            height: SizeConfig.relativeHeight(8) * langs.length,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                      onTap: () {
                        _localizationService
                            .setLanguage(langs[index].shortName);
                      },
                      title: Text(
                        langs[index].name,
                        style: AppTheme.titleTextStyle,
                      ),
                      leading: Padding(
                        padding:
                            EdgeInsets.only(top: SizeConfig.relativeWidth(1)),
                        child: Flags.getFlag(
                            country: langs[index].flagId,
                            height: SizeConfig.relativeHeight(2.5),
                            width: SizeConfig.relativeWidth(8),
                            fit: BoxFit.fill),
                      ),
                      trailing: Container(
                        width: SizeConfig.relativeWidth(10),
                        height: SizeConfig.relativeWidth(10),
                        child: Card(
                          borderOnForeground: true,
                          // with Card
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: langs[index].shortName ==
                                    _localizationService
                                        .currentLanguage.shortName
                                ? Image.asset(
                                    'assets/images/check2@3x.png',
                                  )
                                : null,
                          ),
                          elevation: langs[index].shortName ==
                                  _localizationService.currentLanguage.shortName
                              ? 5.0
                              : 0,
                          shape: CircleBorder(
                              side: langs[index].shortName ==
                                      _localizationService
                                          .currentLanguage.shortName
                                  ? BorderSide.none
                                  : BorderSide(
                                      color: AppTheme.plGreyColor22,
                                      width: 1.0,
                                    )),
                          clipBehavior: Clip.antiAlias,

                          //margin: EdgeInsets.all(10),
                        ),
                      )),
                );
              },
              itemCount: langs.length,
            ),
          );
        });
  }

  Widget buildDialogButton(String title, bool whiteColor, Function callback) {
    var container = Container(
        height: SizeConfig.relativeWidth(15),
        width: SizeConfig.relativeWidth(30),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: whiteColor ? AppTheme.backgroundColor : AppTheme.popColor,
            borderRadius: BorderRadius.all(Radius.circular(23.0)),
            border: Border.all(
              width: 2,
              color: AppTheme.popColor,
            )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      whiteColor ? AppTheme.popColor : AppTheme.backgroundColor,
                  fontFamily: AppTheme.ffRegular,
                )),
          ),
        ));
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.relativeWidth(3),
            right: SizeConfig.relativeWidth(3)),
        child: CircularButton(
          height: SizeConfig.relativeHeight(6),
          whiteColor: whiteColor,
          title: title,
          callback: callback,
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context, DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;

    var column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: AppTheme.popColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          height: SizeConfig.relativeHeight(10),
          child: Center(
              child: Text(
            request.title,
            maxLines: 1,
            style: TextStyle(
              color: AppTheme.backgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          )),
        ),
        Container(
          color: AppTheme.backgroundColor.withOpacity(1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                request.description,
                style: TextStyle(
                    fontFamily: AppTheme.ffRegular,
                    color: AppTheme.popColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                    height: 1.71),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizeConfig.verticalSpacer(1),
        Container(
            /*decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),*/
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isConfirmationDialog)
              buildDialogButton(
                  request.cancelTitle,
                  true,
                  () => _dialogService
                      .dialogComplete(DialogResponse(confirmed: false))),
            //if (isConfirmationDialog) SizeConfig.horizontalSpacer(10),
            buildDialogButton(
                request.buttonTitle,
                isConfirmationDialog ? false : true,
                () => _dialogService
                    .dialogComplete(DialogResponse(confirmed: true)))
          ],
        )),
        SizeConfig.verticalSpacer(3)
      ],
    );
    return WillPopScope(
      onWillPop: () async {
        if (isConfirmationDialog) {
          _dialogService.dialogComplete(DialogResponse(confirmed: false));
        }
        return true;
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: column,
      ),
    );
  }
}
