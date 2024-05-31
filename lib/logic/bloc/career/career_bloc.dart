import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'career_event.dart';
part 'career_state.dart';

class CareerBloc extends Bloc<CareerEvent, CareerState> {
  CareerBloc() : super(CareerInitial()) {
    on<CareerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
