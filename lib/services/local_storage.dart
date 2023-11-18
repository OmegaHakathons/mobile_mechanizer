import 'dart:developer';

import 'package:agro_mech/models/task/aggregate.dart';
import 'package:agro_mech/models/task/car.dart';
import 'package:agro_mech/models/task/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'entities/card_ekzh.dart';
import 'entities/tariff.dart';
import 'https_service.dart';
// import 'secure_storage_service.dart';
// import 'package:hive/hive.dart';

// class LocalStorage {

Future<CardRepository> initialiseHive() async {
  //key
  const cardKey = 'cards';
  //adapters
  // Hive.registerAdapter(CardAdapter());
  // Hive.registerAdapter(TariffAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CarAdapter());

  //box
  final box = await Hive.openBox<Task?>(cardKey);
  final carBox = await Hive.openBox<Car>(cardKey);
  //repos
  return CardRepository(cardBox: box);
}

// }

class CardRepository {
  CardRepository({required Box<Task?> cardBox}) : _cardBox = cardBox;

  final _httpsService = HttpsService();

  final Box<Task?> _cardBox;

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

  Future addNewCards({required List<Task> newCards}) async {
    final existanceCards = _cardBox.keys;
    newCards.removeWhere((e) => existanceCards.contains(e.id));
    await saveCardsLocally(cards: newCards);
  }

  Future<void> saveCardsLocally({
    required List<Task> cards,
  }) async {
    for (final card in cards) {
      await _cardBox.put(card.id, card);
    }
  }

  Future<Task?> getCardByNumber(int id) async {
    return _cardBox.get(id);
  }

  Future fetchAllLocalCards() async {
    // final count = _cardBox.keys.length;
    // log('Количество ключей $count');
    final localCards = _cardBox.values.toList();
    return localCards;
  }
}
