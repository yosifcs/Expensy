import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensy/Model/data/category.dart';
import 'package:expensy/ViewModel/expense_repo.dart';


part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  ExpenseRepository expenseRepository;

  GetCategoriesBloc(this.expenseRepository) : super(GetCategoriesInitial()) {
    on<GetCategories>((event, emit) async {
      emit(GetCategoriesLoading());
      try {
        List<Category> categories = (await expenseRepository.getCategory()).cast<Category>();
        emit(GetCategoriesSuccess(categories));
      } catch (e) {
        emit(GetCategoriesFailure());
      }
    });
  }
}