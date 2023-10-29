part of 'plan_bloc.dart';

@immutable
sealed class PlanEvent {
}

class AddPlan extends PlanEvent{
  final Plan plan;
  AddPlan({required this.plan});
}
