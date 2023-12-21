import 'package:tour_co/models/pic_change.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedPicChange extends Model {
  PicChange pc = PicChange();

  togglePic() {
    if (pc.pic == "pro_pic.jpg") {
      pc.pic = "pro_pic2.jpg";
    } else {
      pc.pic = "pro_pic.jpg";
    }
    notifyListeners();
  }
}
