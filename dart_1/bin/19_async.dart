void main(List<String> args) {
  final DataService dataService = DataService();

  dataService.getData().then((value) => print('result $value'));
  // weitere anweisungen sind, würden abgearbeitet werden
}

class DataService {
  Future<String> _getOtherDataFromCloud() async {
    await Future.delayed(Duration(seconds: 3));
    return 'other data';
  }

  Future<String> _getDataFromCloud() async {
    await Future.delayed(Duration(seconds: 4));
    return 'fake data';
  }

  Future<String> _parseDataFromCloud({required String dataFromCloud}) async {
    await Future.delayed(Duration(seconds: 2));

    return 'parsed data';
  }

  Future<String> getData() async {
    // final String otherData = await _getOtherDataFromCloud();
    // final String dataFromCloud = await _getDataFromCloud();
    // Dauer bis hierhin 7 Sekunden

    final Future otherDataFuture = _getOtherDataFromCloud();
    final Future cloudDataFuture = _getDataFromCloud();

    final String resultCloud = await cloudDataFuture;
    final String resultOther = await otherDataFuture;
    // Alternative ca 4 Sekunden Wartezeit

    final [resultCloudAlternative, resultOtherAlternative] = await Future.wait([
      _getDataFromCloud(),
      _getOtherDataFromCloud(),
    ]);

    final String parsedData = await _parseDataFromCloud(dataFromCloud: resultCloud);

    return parsedData;
  }
}
