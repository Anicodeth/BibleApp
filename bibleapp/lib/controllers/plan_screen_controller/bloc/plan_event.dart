part of 'plan_bloc.dart';

@immutable
sealed class PlanEvent {
}

class AddPlan extends PlanEvent{
  final Plan plan;
  AddPlan({required this.plan});
}

class MarkAsDone extends PlanEvent{
  final String title;
  final int dayidx;
  MarkAsDone({required this.title, required this.dayidx});
}

class UndoMark extends PlanEvent {
  final String title;
  final int dayidx;
  UndoMark({required this.title, required this.dayidx});
}

class DeletePlan extends PlanEvent{
  final Plan plan;
  DeletePlan({required this.plan});
}