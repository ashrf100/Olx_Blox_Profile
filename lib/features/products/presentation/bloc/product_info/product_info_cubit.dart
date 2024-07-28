import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:meta/meta.dart';

part 'product_info_state.dart';

class ProductInfoCubit extends Cubit<ProductInfoInitial> {
  int pageIndex = 0;
  int quantity = 1;
  CarouselController carouselController = CarouselController();

  ProductInfoCubit()
      : super(const ProductInfoInitial(pageIndex: 0, quantity: 1));

  void updatePageIndex(int index) {
    pageIndex = index;
    emit(ProductInfoInitial(pageIndex: pageIndex, quantity: quantity));
  }

  void incrementQuantity() {
    if (quantity <= 9) {
      quantity++;
      emit(ProductInfoInitial(pageIndex: pageIndex, quantity: quantity));
    }
  }

  void decrementQuantity() {
    if (quantity >= 2) {
      quantity--;
      emit(ProductInfoInitial(pageIndex: pageIndex, quantity: quantity));
    }
  }
}
