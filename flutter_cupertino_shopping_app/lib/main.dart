import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'model/app_state_model.dart';

import 'app.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      child: CupertinoStoreApp(),
      create: (context) => AppStateModel()..loadProducts(),
    ),
  );
}
