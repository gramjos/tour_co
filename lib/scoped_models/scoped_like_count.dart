import 'package:tour_co/models/like_count.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedLikeCount extends Model {
  LikeCount lc = LikeCount();

  increment(){
    lc.likeCT += 1 ; 

    notifyListeners(); 
  }
}