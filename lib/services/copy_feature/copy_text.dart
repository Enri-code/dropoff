import 'package:flutter/services.dart';

copyTextToClipboard({required String textToCopy, required String message}) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  // mySnackbar(message: message, title: "Business Link");
}
