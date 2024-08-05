class Data {
  final DateTime date;
  final String? value;
  final String? url;
  Data( {required this.date, this.value,this.url,});
}

class DataHub {
  static List<Data> dailyData = [
    Data(date: DateTime.now(), value: 'today i woke up and went to gym'),
    ...List.generate(
        10,
        (index) => Data(
            date: DateTime.now().subtract(Duration(days: index)),
            value: 'I wake up and go to ${[
              'school',
              'work',
              'gym',
              'market',
              'home'
            ][index % 5]}'))
  ];

  static List<Data> weeklyData = [
    Data(date: DateTime.now(), value: 'today i woke up and went to gym'),
    ...List.generate(
        10,
        (index) => Data(
            date: DateTime.now().subtract(Duration(days: index)),
            value: 'I wake up and go to ${[
              'school',
              'work',
              'gym',
              'market',
              'home'
            ][index % 5]}'))
  ];
}
