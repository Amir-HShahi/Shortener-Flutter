import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:url_shortener/view_model/link_view_model.dart';

List<SingleChildWidget> providersData = [
  ChangeNotifierProvider(create: (_) => LinkViewModel()),
];