import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CallController extends GetxController{
  makingPhoneCall() async {
    var url = Uri.parse("tel:2266154999");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}