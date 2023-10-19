import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

  static Future<BuildContext?> showMessageModal({
    required String message,
    Function()? onClose
  })async {
    BuildContext? dialogContext;

    showDialog(
      context: navState.currentContext!,
      barrierColor: Colors.black.withOpacity(.8),
      barrierDismissible: true,
      builder: (BuildContext context) {
        dialogContext = context;
        return WillPopScope(
            onWillPop: () {
              closeLoader(dialogContext);
              if(onClose != null){
                onClose();
              }
              return Future.value(true);
            },
            child: SimpleDialog(
              contentPadding: const EdgeInsets.only(top: 20, bottom: 0),
              backgroundColor: Colors.white,
              children: [
                Container(
                  constraints: const BoxConstraints(
                      maxWidth: 250
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(message,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 5),
                const Divider(),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        closeLoader(dialogContext);
                        if(onClose != null){
                          onClose();
                        }
                      },
                      child: SizedBox(
                        height:30,
                        width: 60,
                        child: Center(child: Text("OK", style: Theme.of(context).textTheme.bodySmall)),)
                  ),
                ),
                const SizedBox(height: 5),
              ],
            )
        );
      },
    );

    return dialogContext;
  }

  static void closeLoader(BuildContext? context){
    if(context != null){
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

}