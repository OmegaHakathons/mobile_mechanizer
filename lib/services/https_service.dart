import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:agro_mech/models/task/aggregate.dart';
import 'package:agro_mech/models/task/car.dart';
import 'package:agro_mech/models/task/task.dart';
import 'package:http/http.dart';
import 'package:retry/retry.dart';
import 'package:uuid/uuid.dart';

import 'entities/auth_entities.dart';
import 'entities/pending_request.dart';
import 'entities/register_entities.dart';
import 'entities/service_entity.dart';
import 'repository.dart';
import 'token_service.dart';

enum AuthType { password, pin }

class HttpsService {
  static final HttpsService _instance = HttpsService._internal();

  factory HttpsService() {
    return _instance;
  }

  HttpsService._internal() {
    // init logic
  }

  final _baseUrl = "bbakoh6pgrn8kcsnlijj.containers.yandexcloud.net";
  final _api = "";
  final _client = Client();
  final _tokenService = TokenService();

  Future<String> auth(
      {required String email,
      required String pass
      }) async {
    Map request = {
      "username": email,
      "password": pass,
    };
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final url = Uri.https(_baseUrl, '$_api/auth/login');
    final body = json.encode(request);
    return retry(
      () async {
        final response = await _client.post(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 201) {
          var value = response.body;
          await _tokenService.saveToken(value);
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

  Future<String> authNFC(
      {required String token,
      required String code
      }) async {
    Map request = {
      "token": token,
      "code": code,
    };
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final url = Uri.https(_baseUrl, '$_api/auth/nfc-login');
    final body = json.encode(request);
    return retry(
      () async {
        final response = await _client.post(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 201) {
          var value = response.body;
          // var value = AuthResponse.fromJson(jsonDecode(response.body));
          // final token = value.data.token;
          await _tokenService.saveToken(value);
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

  Future hello() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final url = Uri.https(_baseUrl, '$_api/auth/nfc-login');
    // final body = json.encode();
    return retry(
      () async {
        final response = await _client.get(
          url,
          headers: headers,
        );
        if (response.statusCode == 200) {
          return;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

//   Future<RegisterEntities> getRegistr({required DateTime? lastUpdate}) async {
//     // final token = await _tokenService.getToken();
//     // if (token == null) {
//     //   throw Exception("There is no token");
//     // }

//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//     };

//     Map<String, String>? query;
//     if (lastUpdate != null) {
//       query = {'updated_at': lastUpdate.toUtc().toString()};
//     }

//     final url = Uri.https(_baseUrl, '$_api/cards', query);
//     return retry(
//       () async {
//         log('начали получать карты');
//         final response = await _client.get(
//           url,
//           headers: headers,
//         );
//         if (response.statusCode == 200) {
//           var value =
//               RegisterEntities.fromServer(jsonDecode(response.body)['data']);
//           log('успех карты');
//           return value;
//         } else {
//           throw Exception("Failed to logIn");
//         }
//       },
//       maxAttempts: 3,
//       retryIf: (e) => e is TimeoutException,
//     );
//   }

//   // MARK: - Shift
//   Future startShift() async {
//     final token = await _tokenService.getToken();
//     if (token == null) {
//       throw Exception("There is no token");
//     }
//     Map requestedBody = {"request_at": DateTime.now().toUtc().toString()};
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token",
//     };
//     final body = json.encode(requestedBody);
//     final url = Uri.https(_baseUrl, '$_api/shift/start');
//     await retry(
//       () async {
//         final response = await _client.post(url, headers: headers, body: body);
//         if (response.statusCode == 200) {
//           var value = jsonDecode(response.body);
//           return value;
//         } else if (response.statusCode == 409) {
//           await stopShift();
//           throw TimeoutException("temp");
//         } else {
//           throw Exception("Failed to logIn");
//         }
//       },
//       maxAttempts: 3,
//       retryIf: (e) => e is TimeoutException,
//     ).onError((e, _) async {
//       if (e is TimeoutException || e is SocketException) {
//         log('не получилось отправить начало смены');
//         final request = PendingRequest(
//             url: url.toString(),
//             body: body,
//             headers: json.encode(headers),
//             id: const Uuid().v4().toString());
//         log('сохранили начало смены');
//         return await Repository().savePendingRequest(request);
//       }
//     });
//   }

//   Future stopShift() async {
//     final token = await _tokenService.getToken();
//     if (token == null) {
//       throw Exception("There is no token");
//     }
//     Map requestedBody = {"request_at": DateTime.now().toUtc().toString()};
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//       "Authorization": "Bearer $token",
//     };
//     final body = json.encode(requestedBody);
//     final url = Uri.https(_baseUrl, '$_api/shift/stop');
//     return retry(
//       () async {
//         final response = await _client.post(url, headers: headers, body: body);
//         if (response.statusCode == 200) {
//           var value = jsonDecode(response.body);
//           return value;
//         } else {
//           throw Exception("Failed to logIn");
//         }
//       },
//       maxAttempts: 3,
//       retryIf: (e) => e is TimeoutException,
//     ).onError((e, _) async {
//       if (e is TimeoutException || e is SocketException) {
//         log('не получилось отправить окончания смены');
//         final request = PendingRequest(
//             url: url.toString(),
//             body: body,
//             headers: json.encode(headers),
//             id: const Uuid().v4().toString());
//         log('сохранили окончения смены');
//         return await Repository().savePendingRequest(request);
//       }
//     });
//   }

//   // MARK: - route
//   Future getStatus() async {
//     return Future.delayed(Duration(seconds: 10), () {
//       return "затычка";
//     });
//   }

//   Future startRoute({
//     required String vehicleNumber,
//     required int busRouteId,
//     required double lat,
//     required double lng,
//   }) async {
//     final token = await _tokenService.getToken();
//     if (token == null) {
//       throw Exception("There is no token");
//     }
//     Map request = {
//       "vehicle_number": vehicleNumber,
//       "pos_lat": 12.83281,
//       "pos_lng": 72.91239,
//       "bus_route_id": busRouteId,
//       "request_at": DateTime.now().toUtc().toString()
//     };
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token",
//     };
//     final body = json.encode(request);
//     final url = Uri.https(_baseUrl, '$_api/shift/route/start');
//     return retry(
//       () async {
//         final response = await _client.post(url, headers: headers, body: body);
//         if (response.statusCode == 200) {
//           var value = jsonDecode(response.body);
//           log('отправили начало маршрута');
//           return value;
//         } else {
//           throw Exception("Failed to logIn");
//         }
//       },
//       maxAttempts: 3,
//       retryIf: (e) => e is TimeoutException,
//     ).onError((e, _) async {
//       if (e is TimeoutException || e is SocketException) {
//         log('не получилось отправить начало марштура');
//         final request = PendingRequest(
//             url: url.toString(),
//             body: body,
//             headers: json.encode(headers),
//             id: const Uuid().v4().toString());
//         log('сохранили начало маршрута');
//         return await Repository().savePendingRequest(request);
//       }
//     });
//   }

//   Future stopRoute() async {
//     final token = await _tokenService.getToken();
//     if (token == null) {
//       throw Exception("There is no token");
//     }
//     Map request = {"request_at": DateTime.now().toUtc().toString()};
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token",
//     };
//     final body = json.encode(request);
//     final url = Uri.https(_baseUrl, '$_api/shift/route/stop');
//     return retry(
//       () async {
//         final response = await _client.post(
//           url,
//           headers: headers,
//           body: body,
//         );
//         if (response.statusCode == 200) {
//           var value = jsonDecode(response.body);
//           log('отправили конец маршрута');
//           return value;
//         } else {
//           throw Exception("Failed to logIn");
//         }
//       },
//       maxAttempts: 3,
//       retryIf: (e) => e is TimeoutException,
//     ).onError((e, _) async {
//       if (e is TimeoutException || e is SocketException) {
//         log('не получилось отправить окончание марштура');
//         final request = PendingRequest(
//             url: url.toString(),
//             body: body,
//             headers: json.encode(headers),
//             id: const Uuid().v4().toString());
//         log('сохранили окончания маршрута');
//         return await Repository().savePendingRequest(request);
//       }
//     });
//   }

//   Future cardCheck(int cardNumber) async {
//     final token = await _tokenService.getToken();
//     if (token == null) {
//       throw Exception("There is no token");
//     }
//     Map request = {
//       "card_number": cardNumber,
//       "request_at": DateTime.now().toUtc().toString(),
//     };
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token",
//     };
//     final body = json.encode(request);
//     final url = Uri.https(_baseUrl, '$_api/card/check');
//     return retry(
//       () async {
//         final response = await _client.post(
//           url,
//           headers: headers,
//           body: body,
//         );
//         if (response.statusCode == 200) {
//           var value = jsonDecode(response.body);
//           return value;
//         } else {
//           throw Exception("Failed to logIn");
//         }
//       },
//       maxAttempts: 3,
//       retryIf: (e) => e is TimeoutException,
//     ).onError((e, _) async {
//       if (e is TimeoutException || e is SocketException) {
//         log('не получилось отправить начало марштура');
//         final request = PendingRequest(
//             url: url.toString(),
//             body: body,
//             headers: json.encode(headers),
//             id: const Uuid().v4().toString());
//         log('сохранили начало маршрута');
//         return await Repository().savePendingRequest(request);
//       }
//     });
//   }

//   // MARK: - Services
//   Future getServices() async {
//     final token = await _tokenService.getToken();
//     if (token == null) {
//       throw Exception("There is no token");
//     }
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token",
//     };
//     final url = Uri.https(_baseUrl, '$_api/company/services');
//     return retry(
//       () async {
//         final response = await _client.get(
//           url,
//           headers: headers,
//         );
//         if (response.statusCode == 200) {
//           return serviceEntityFromJson(response.body);
//         } else {
//           throw Exception("Failed to logIn");
//         }
//       },
//       maxAttempts: 3,
//       retryIf: (e) => e is TimeoutException,
//     );
//   }

  Future getTasks() async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final url = Uri.https(_baseUrl, '$_api/task');
    return retry(
      () async {
        final response = await _client.get(url, headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('получение тасок');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось получить task');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.get);
        log('сохранили таску на потом');
        return await Repository().savePendingRequest(request);
      }
    });
  }
  
  Future createTask({required Task task}) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final body = json.encode(task);
    final url = Uri.https(_baseUrl, '$_api/task');
    return retry(
      () async {
        final response = await _client.post(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили создание таски');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить создание таски');
        final request = PendingRequest(
            url: url.toString(),
            body: body,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.post);
        log('сохранили создание таски');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future getTask({required int id}) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    // final body = json.encode(jsonEncode(task));
    final url = Uri.https(_baseUrl, '$_api/task/$id');
    return retry(
      () async {
        final response = await _client.get(
          url,
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили получение таски');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить получение таски');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.get);
        log('сохранили получение таски');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future updateTask({
    required int id,
    required Task task
    }) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final body = json.encode(task);
    final url = Uri.https(_baseUrl, '$_api/task/$id');
    return retry(
      () async {
        final response = await _client.put(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили обновление таски');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить обновление таски');
        final request = PendingRequest(
            url: url.toString(),
            body: body,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.put);
        log('сохранили обновление таски');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future deleteTask({
    required int id,
    }) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final url = Uri.https(_baseUrl, '$_api/task/$id');
    return retry(
      () async {
        final response = await _client.delete(
          url,
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили удаление таски');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить удаление таски');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.delete);
        log('сохранили удаление таски');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  // MARK: - Car
  Future getCars() async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final url = Uri.https(_baseUrl, '$_api/car');
    return retry(
      () async {
        final response = await _client.get(url, headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('получение Cars');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить Cars');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.get);
        log('сохранили Cars на потом');
        return await Repository().savePendingRequest(request);
      }
    });
  }
  
  Future createCar({required Car car}) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final body = json.encode(car);
    final url = Uri.https(_baseUrl, '$_api/car');
    return retry(
      () async {
        final response = await _client.post(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили создание Car');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить создание Car');
        final request = PendingRequest(
            url: url.toString(),
            body: body,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.post);
        log('сохранили создание Car');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future getCar({required int id}) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    // final body = json.encode(jsonEncode(task));
    final url = Uri.https(_baseUrl, '$_api/car/$id');
    return retry(
      () async {
        final response = await _client.get(
          url,
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили получение Car');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить получение Car');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.get);
        log('сохранили получение Car');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future updateCar({
    required int id,
    required Task task
    }) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final body = json.encode(task);
    final url = Uri.https(_baseUrl, '$_api/car/$id');
    return retry(
      () async {
        final response = await _client.put(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили обновление Car');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить обновление Car');
        final request = PendingRequest(
            url: url.toString(),
            body: body,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.put);
        log('сохранили обновление Car');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future deleteCar({
    required int id,
    }) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final url = Uri.https(_baseUrl, '$_api/car/$id');
    return retry(
      () async {
        final response = await _client.delete(
          url,
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили удаление Car');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить удаление Car');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.delete);
        log('сохранили удаление Car');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  // MARK: - Aggregate
  Future getAggregates() async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final url = Uri.https(_baseUrl, '$_api/aggregate');
    return retry(
      () async {
        final response = await _client.get(url, headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('получение Aggregates');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить Aggregates');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.get);
        log('сохранили Aggregates на потом');
        return await Repository().savePendingRequest(request);
      }
    });
  }
  
  Future createAggregate({required Aggregate aggregate}) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final body = json.encode(aggregate);
    final url = Uri.https(_baseUrl, '$_api/aggregate');
    return retry(
      () async {
        final response = await _client.post(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили создание Aggregate');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить создание Aggregate');
        final request = PendingRequest(
            url: url.toString(),
            body: body,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.post);
        log('сохранили создание Aggregate');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future getAggregate({required int id}) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    // final body = json.encode(jsonEncode(task));
    final url = Uri.https(_baseUrl, '$_api/aggregate/$id');
    return retry(
      () async {
        final response = await _client.get(
          url,
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили получение Aggregate');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить получение Aggregate');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.get);
        log('сохранили получение Aggregate');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future updateAggregate({
    required int id,
    required Task task
    }) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final body = json.encode(task);
    final url = Uri.https(_baseUrl, '$_api/aggregate/$id');
    return retry(
      () async {
        final response = await _client.put(
          url,
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили обновление Aggregate');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить обновление Aggregate');
        final request = PendingRequest(
            url: url.toString(),
            body: body,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.put);
        log('сохранили обновление Aggregate');
        return await Repository().savePendingRequest(request);
      }
    });
  }

  Future deleteCar({
    required int id,
    }) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    // Map request = {"request_at": DateTime.now().toUtc().toString()};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final url = Uri.https(_baseUrl, '$_api/car/$id');
    return retry(
      () async {
        final response = await _client.delete(
          url,
          headers: headers,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          log('отправили удаление Car');
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    ).onError((e, _) async {
      if (e is TimeoutException || e is SocketException) {
        log('не получилось отправить удаление Car');
        final request = PendingRequest(
            url: url.toString(),
            body: null,
            headers: json.encode(headers),
            id: const Uuid().v4().toString(),
            type: HttpType.delete);
        log('сохранили удаление Car');
        return await Repository().savePendingRequest(request);
      }
    });
  }



  // MARK: - Pending requests
  Future sendPendingRequests(PendingRequest request) async {
    final body = request.body;
    Map<String, dynamic> headers = json.decode(request.headers);
    Map<String, String> finalHeaders =
        headers.map((key, value) => MapEntry(key, value.toString()));
    final url = Uri.parse(request.url);

    return retry(
      () async {
        dynamic response;
        switch (request.type) {
          case HttpType.get: 
            response = await _client.get(url, headers: finalHeaders);
            break;
          case HttpType.post: 
            response = await _client.post(url, headers: finalHeaders, body: body);
            break;
          case HttpType.delete: 
            response = await _client.delete(url, headers: finalHeaders, body: body);
            break;
          case HttpType.put: 
            response = await _client.put(url, headers: finalHeaders, body: body);
            break;
        }
        if (response.statusCode == 200 || response.statusCode == 201) {
          var value = jsonDecode(response.body);
          await Repository().flushPendingRequest(request);
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }
}
