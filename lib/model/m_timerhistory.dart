// stores ExpansionPanel state information
class TimerHistory {
  TimerHistory({
    this.id,
    this.expandedValue,
    this.headerValue,
  });

  int id;
  String expandedValue;
  String headerValue;
}

List<TimerHistory> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return TimerHistory(
      id: index,
      headerValue: 'Masker ke - $index',
      expandedValue: 'This is masker number - $index',
    );
  });
}