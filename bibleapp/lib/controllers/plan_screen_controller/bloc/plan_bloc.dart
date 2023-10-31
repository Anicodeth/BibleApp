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

      if (event is MarkAsDone){

        Plan? plan = await planBox.get(event.title);
        if (plan != null){
          plan.days.add("day${event.dayidx}");
          await planBox.put(event.title, plan);
          emit(PlansLoaded(plans: planBox.values.toList()));
        }
      }

      if (event is UndoMark){

        Plan? plan = await planBox.get(event.title);
        if (plan != null){
          plan.days.remove("day${event.dayidx}");
          await planBox.put(event.title, plan);
          emit(PlansLoaded(plans: planBox.values.toList()));
        }
      }

      if (event is DeletePlan){
        planBox.delete(event.plan.title);
        emit(PlansLoaded(plans: planBox.values.toList()));

      }
      
    });
  }
}
