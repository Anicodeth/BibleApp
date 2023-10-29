import 'package:bibleapp/models/plan/plan.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final Box<Plan> planBox;

  PlanBloc({required this.planBox}) : super(PlansLoaded(plans: planBox.values.toList())) {
    on<PlanEvent>((event, emit) async {

      if (event is AddPlan){
        await planBox.put(event.plan.title, event.plan);
        emit(PlansLoaded(plans: planBox.values.toList()));
      }
      
    });
  }
}
