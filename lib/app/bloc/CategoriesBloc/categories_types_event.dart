




import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwellery_app/app/repositories/categories_repositories.dart.dart';
import 'package:jwellery_app/model/categoriestypes_model.dart';

abstract class CategoriesTypesEvent  extends Equatable{
  const CategoriesTypesEvent();

  @override
  List<Object> get props => [];
}

class FetchCategoriesTypes extends CategoriesTypesEvent{

}


abstract class CategoriesTypesState extends Equatable{
  const CategoriesTypesState();
  
  @override
  List<Object> get props => [];
}

 class CategoriesTypesInitial extends CategoriesTypesState {}

  class CategoriesTypesLoading extends CategoriesTypesState {}

   class CategoriesTypesLoaded extends CategoriesTypesState {
    List<Category>? categoriesTypes;

     CategoriesTypesLoaded({required this.categoriesTypes});
   }

class CategoriesTypesError extends CategoriesTypesState {
  final String errorMessage;

  const CategoriesTypesError({required this.errorMessage});
}
// bloc
class CategoriesTypesBloc extends Bloc<CategoriesTypesEvent, CategoriesTypesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesTypesBloc({required this.categoriesRepository}) : super(CategoriesTypesInitial()) {
    on<FetchCategoriesTypes>((event, emit) async{
      emit(CategoriesTypesLoading());
      try{
      final categories= await categoriesRepository.getCategoryTypes();
      emit(CategoriesTypesLoaded(categoriesTypes: categories));

      } catch(e){
        final message = e.toString();
        emit(CategoriesTypesError(errorMessage: message));
      }
      
    });
  }
}





