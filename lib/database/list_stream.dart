import 'dart:async';

import 'package:namegenerator/models/bussiness_name.dart';

class ListStream {
  static List<BussinessName> bussinesses = [];

  static addBussinessName(List<BussinessName> bussinessList) {
    bussinesses.addAll(bussinessList);
    _controller.sink.add(bussinesses);
  }

  static removeBussinessFromList(int index) {
    bussinesses.removeAt(index);
    _controller.sink.add(bussinesses);
  }

  static toggleNewValue(int index) {
    BussinessName name = bussinesses.elementAt(index);
    bussinesses.removeAt(index);
    bussinesses.insert(
        index,
        new BussinessName(
            id: name.id, name: name.name, isLiked: !name.isLiked));
    _controller.sink.add(bussinesses);
  }

  static final _controller = StreamController<List<BussinessName>>();

  static Stream<List<BussinessName>> get stream => _controller.stream;
}
