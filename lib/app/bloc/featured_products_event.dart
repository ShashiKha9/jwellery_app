
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwellery_app/app/repositories/featured_repositories.dart';
import 'package:jwellery_app/model/featured_model.dart';

abstract class FeaturedProductsEvent extends Equatable {
  const FeaturedProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchedFeaturedProducts extends FeaturedProductsEvent{

}

class AddWishList extends FeaturedProductsEvent{
  final int categoryId;
 const  AddWishList({required this.categoryId});
  @override
  List<Object> get props => [categoryId];

}



//state
abstract class FeaturedProductsState extends Equatable {
  const FeaturedProductsState();
  
  @override
  List<Object> get props => [];
}

 class FeaturedProductsInitial extends FeaturedProductsState {}

 class FeaturedProductsLoading extends FeaturedProductsState {}

 class FeaturedProductsLoaded extends FeaturedProductsState {
  List<FeaturedModel>? featuredProducts;

   FeaturedProductsLoaded({required this.featuredProducts});
}


 class FeaturedProductsError extends FeaturedProductsState {
  final String message;

const FeaturedProductsError({required this.message});
}

//bloc
class FeaturedProductsBloc extends Bloc<FeaturedProductsEvent, FeaturedProductsState> {
  // List<FeaturedModel> _features=[];
  final FeaturedRepository featuredRepository;
  FeaturedProductsBloc({required this.featuredRepository}) : super(FeaturedProductsInitial()) {
    on<FetchedFeaturedProducts>(_onFetchedProducts);
    on<AddWishList>(_onAddWishlist);
  }
  void _onFetchedProducts(FetchedFeaturedProducts event,Emitter<FeaturedProductsState> emit) async{
    emit(FeaturedProductsLoading());
    try{
        final featured= await featuredRepository.getFeaturedProducts();

        emit(FeaturedProductsLoaded(featuredProducts: featured));


    } catch (e){
         final String message = e.toString();
        emit(FeaturedProductsError(message: message));

    }

  }
  void _onAddWishlist(AddWishList event, Emitter<FeaturedProductsState> emit) async{
    try{
      if(state is FeaturedProductsLoaded){
        final currentState = state as FeaturedProductsLoaded;
        final updatedList = currentState.featuredProducts!.map((featured){
          if(featured.id==event.categoryId){
            featured.isFavorite = !featured.isFavorite;
          }
          return featured;

        }).toList();
            emit(FeaturedProductsLoaded(featuredProducts: updatedList));

      }

} catch(e){
  final String message= e.toString();
  emit(FeaturedProductsError(message: message));

}


}

}





