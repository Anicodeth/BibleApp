part of 'plan_bloc.dart';

@immutable
sealed class PlanState {}

final class PlanInitial extends PlanState {
  final List<Plan> plans;
  PlanInitial({required this.plans});
}

class PlansLoaded extends PlanState{
  final List<Plan> plans;
  PlansLoaded({required this.plans});
}
