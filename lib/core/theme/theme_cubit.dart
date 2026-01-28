import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

/// Simple theme state - Arc Raiders theme only
/// Kept for potential future expansion but currently single-theme
@injectable
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true); // Always Arc Raiders theme
}
