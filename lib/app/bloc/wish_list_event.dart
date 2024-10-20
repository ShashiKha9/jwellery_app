
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwellery_app/app/bloc/featured_products_event.dart';
import 'package:jwellery_app/app/model/featured_model.dart';

abstract class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object> get props => [];
}
class FetchWishlist extends WishListEvent{}

abstract class WishListState extends Equatable {
  const WishListState();
  
  @override
  List<Object> get props => [];
}
// state

final class WishListInitial extends WishListState {}

final class WishListLoading extends WishListState {}

final class WishListLoaded extends WishListState {
  final List<FeaturedModel> wishlistProducts;
  const WishListLoaded({required this.wishlistProducts});
}

final class WishListError extends WishListState {
  final String message;
  const WishListError({required this.message});
}

// bloc
class WishListBloc extends Bloc<WishListEvent, WishListState> {
  final FeaturedProductsBloc featuredProductsBloc;
  
  WishListBloc({required this.featuredProductsBloc}) : super(WishListInitial()) {
    on<FetchWishlist>(_onFetchWishlist);
      featuredProductsBloc.stream.listen((state){
        if(state is FeaturedProductsLoaded){
          add(FetchWishlist());
        }
      });
   
  }
  void _onFetchWishlist(FetchWishlist event, Emitter<WishListState>emit)async{
    try{
    if(featuredProductsBloc.state is FeaturedProductsLoaded){
      final featuredProductsState = featuredProductsBloc.state as FeaturedProductsLoaded;
      final wishlist= featuredProductsState.featuredProducts!.where((feature)=> feature.isFavorite).toList();
       emit(WishListLoaded(wishlistProducts: wishlist ?? []));

      
    }else{
          emit(WishListError(message: 'Featured products not loaded yet.'));

    }

  } catch(e){
    final String message=e.toString();
     emit(WishListError(message: message));
  }
}
}






