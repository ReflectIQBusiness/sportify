class StepGoal {
  final int id;
  final String title;
  final String description;
  final List<Choice> choices;
  int? idChoiceSelected;

  StepGoal({
    required this.id,
    required this.title,
    required this.description,
    required this.choices,
    required this.idChoiceSelected,
  });
}

class Choice {
  final int id;
  final String title;

  Choice({
    required this.id,
    required this.title,
  });
}
