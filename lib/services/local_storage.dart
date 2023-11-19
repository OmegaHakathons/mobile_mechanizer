import 'dart:developer';

import 'package:agro_mech/models/task/aggregate.dart';
import 'package:agro_mech/models/task/car.dart';
import 'package:agro_mech/models/task/task.dart';
import 'package:agro_mech/services/reachability_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'entities/card_ekzh.dart';
import 'entities/tariff.dart';
import 'https_service.dart';
// import 'secure_storage_service.dart';
// import 'package:hive/hive.dart';

// class LocalStorage {

Future<CardRepository> initialiseHive() async {
  //key
  const taskKey = 'task';
  const carKey = 'car';
  const aggregateKey = 'aggregate';
  const userKey = 'user';
  //adapters
  // Hive.registerAdapter(CardAdapter());
  // Hive.registerAdapter(TariffAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(AggregateAdapter());
  // Hive.registerAdapter(UserAdapter());

  //box
  final taskBox = await Hive.openBox<Task?>(taskKey);
  final carBox = await Hive.openBox<Car>(carKey);
  final aggregateBox = await Hive.openBox<Aggregate>(aggregateKey);
  // final userBox = await Hive.openBox<User>(aggregateKey);
  //repos
  return CardRepository(taskBox: taskBox, carBox: carBox, aggBox: aggregateBox);
}

// }

class CardRepository {
  CardRepository({required Box<Task?> taskBox, required Box<Car> carBox, required Box<Aggregate> aggBox}) : _taskBox = taskBox, _carBox = carBox, _aggBox = aggBox;

  final _httpsService = HttpsService();

  final Box<Task?> _taskBox;
  final Box<Car?> _carBox;
  final Box<Aggregate?> _aggBox;
  // Future<List<CardEkzh>> getCards() async {
  //   log("получаем последнее время обновления");
  //   DateTime? lastUpdate;
  //   final gettedTime = await SecureStorageService().getLastupdateDateTime();
  //   if (gettedTime != null) {
  //     lastUpdate = DateTime.parse(gettedTime);
  //   }
  //   log('Начали грузить карты');
  //   final response = await _httpsService.getRegistr(lastUpdate: lastUpdate);
  //   log('Загрузили, количество ${response.registers.length}');
  //   await SecureStorageService().saveLastupdateDateTime(response.lastUpdated);

  //   final cards = response.registers
  //       .map(
  //           ((e) => CardEkzh.fromRegister(e, response.names, response.tariffs)))
  //       .toList();

  //   return cards;
  // }

  Future getTasks() async {
    if (ReachabilityService().isNetworkAvailable) {
      final tasks = await _httpsService.getTasks();
      await addNewTasks(newCards: tasks);
      return tasks;
    } else {
      return await fetchAllLocalTasks();
    }
  }

  Future getCar() async {
    if (ReachabilityService().isNetworkAvailable) {
      final items = await _httpsService.getCars();
      await addNewCars(cars: items);
      return items;
    } else {
      return await fetchAllLocalCars();
    }
  }

  Future getAggregate() async {
    if (ReachabilityService().isNetworkAvailable) {
      final items = await _httpsService.getAggregates();
      await addNewAggregates(items: items);
      return items;
    } else {
      return await fetchAllLocalAggregates();
    }
  }

  Future addNewAggregates({required List<Aggregate> items}) async {
    final existanceItems = _aggBox.keys;
    items.removeWhere((e) => existanceItems.contains(e.id));
    await saveAggregatesLocally(items: items);
  }

  Future saveAggregatesLocally({
    required List<Aggregate> items,
  }) async {
    for (final item in items) {
      await _aggBox.put(item.id, item);
    }
  }

  Future fetchAllLocalAggregates() async {
    final localItems = _aggBox.values.toList();
    return localItems;
  }

  Future addNewCars({required List<Car> cars}) async {
    final existanceCars = _carBox.keys;
    cars.removeWhere((e) => existanceCars.contains(e.id));
    await saveCarsLocally(cars: cars);
  }

  Future saveCarsLocally({
    required List<Car> cars,
  }) async {
    for (final car in cars) {
      await _carBox.put(car.id, car);
    }
  }

  Future fetchAllLocalCars() async {
    final localItems = _carBox.values.toList();
    return localItems;
  }

  Future addNewTasks({required List<Task> newCards}) async {
    final existanceCards = _taskBox.keys;
    newCards.removeWhere((e) => existanceCards.contains(e.id));
    await saveTasksLocally(cards: newCards);
  }
  
  Future<void> saveTasksLocally({
    required List<Task> cards,
  }) async {
    for (final card in cards) {
      await _taskBox.put(card.id, card);
    }
  }

  Future<Task?> getTaskById(int id) async {
    return _taskBox.get(id);
  }

  Future fetchAllLocalTasks() async {
    // final count = _cardBox.keys.length;
    // log('Количество ключей $count');
    final localCards = _taskBox.values.toList();
    return localCards;
  }

}
