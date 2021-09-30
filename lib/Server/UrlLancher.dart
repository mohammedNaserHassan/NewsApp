import 'package:url_launcher/url_launcher.dart';
class Url_Luncher{
  Url_Luncher._();
  static  Url_Luncher helper = Url_Luncher._();

  openWebpage(String url){
    try{
      launch(url,universalLinksOnly: true);
    }on Exception catch(e){
      print(e);
    }
  }

}