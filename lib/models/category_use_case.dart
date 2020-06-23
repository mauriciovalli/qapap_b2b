import 'category.dart';
import 'category_repository.dart';

class GetCategoryUseCase {
  final CategoryRepository _categoryRepository;

  GetCategoryUseCase(this._categoryRepository);

  Future<List<CategoryModel>> execute() {
    return _categoryRepository.get();
  }
}
