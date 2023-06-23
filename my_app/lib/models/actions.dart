enum ActionType { PAGE_FETCH, PAGE_ACTION, API }

class Action {
  ActionType type;
  Map<String, dynamic> params;

  Action(this.type, this.params);

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(ActionType.values.byName(json['type']), json['params']);
  }
}
