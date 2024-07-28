import 'package:bloc/bloc.dart';
import 'package:olx_bloc/features/localizations/domain/entities/localization.dart';
import 'package:olx_bloc/features/localizations/domain/usecase/localization_usecases.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<ChangeLocaleState> {
  final GetLocalizationUseCase getLocalizationUseCase;
  final ChangeLocalizationUseCase changeLocalizationUseCase;

  LocalCubit(
      {required this.getLocalizationUseCase,
      required this.changeLocalizationUseCase})
      : super(
            ChangeLocaleState(localization: Localization(languageCode: "en")));

  Future<void> getSavedLanguage() async {
    final cachedLanguageCode = await getLocalizationUseCase();
    cachedLanguageCode.fold(
      (failure) => null,
      (localization) => emit(ChangeLocaleState(localization: localization)),
    );
  }

  Future<void> changeLanguage(String languageCode) async {

    
    await changeLocalizationUseCase(Localization(languageCode: languageCode));
  
    emit(ChangeLocaleState(localization: Localization(languageCode: languageCode)));
    
  }
}
