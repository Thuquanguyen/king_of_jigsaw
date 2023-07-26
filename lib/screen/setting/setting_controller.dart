import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import '../../ad_manager.dart';
import '../../core/assets/app_assets.dart';
import '../../core/base/base_controller.dart';
import '../../core/model/base_model.dart';
import '../../core/model/music_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/model/vibration_model.dart';

class SettingController extends BaseController {

  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;


  RxList<BaseModel> listStrength = [
    BaseModel(title: 'Soft',isPremium: false,isSelected: true,onTap: (){
      Vibration.vibrate(
          pattern: [50, 50],
          intensities: [1, 80],
          amplitude: 1);
    }),
    BaseModel(title: 'Medium',isPremium: true,isSelected: false,onTap: (){
      Vibration.vibrate(
          pattern: [50, 500],
          intensities: [1, 150],
          amplitude: 50);
    }),
    BaseModel(title: 'Strengths',isPremium: true,isSelected: false,onTap: (){
      Vibration.vibrate(
          pattern: [50, 1000],
          intensities: [1, 255],
          amplitude: 128);
    }),
  ].obs;
  RxList<BaseModel> listSpeed = [
    BaseModel(title: 'Slow',isPremium: false,isSelected: true,onTap: (){
      Vibration.vibrate(
          pattern: [10,1000],
          intensities: [1, 80],
          amplitude: 5);
    }),
    BaseModel(title: 'Medium',isPremium: false,isSelected: false,onTap: (){
      Vibration.vibrate(
          pattern: [80,1000],
          intensities: [1, 150],
          amplitude: 20);
    }),
    BaseModel(title: 'Fast',isPremium: false,isSelected: false,onTap: (){
      Vibration.vibrate(
          pattern: [100,150],
          intensities: [1, 180],
          amplitude: 60);
    }),
    BaseModel(title: 'Continuous',isPremium: true,isSelected: false,onTap: (){
      Vibration.vibrate(
          pattern: [50,50,50,50],
          intensities: [1, 255],
          amplitude: 128);
    }),
  ].obs;
  RxList<BaseModel> listSharpness = [
    BaseModel(title: 'Normal',isPremium: false,isSelected: true,onTap: (){
      Vibration.vibrate(
          pattern: [10,500],
          intensities: [1, 80],
          amplitude: 5);
    }),
    BaseModel(title: 'Rumble',isPremium: true,isSelected: false,onTap: (){
      Vibration.vibrate(
          pattern: [50,1000],
          intensities: [1, 150],
          amplitude: 50);
    }),
    BaseModel(title: 'intense',isPremium: true,isSelected: false,onTap: (){
      Vibration.vibrate(
          pattern: [80,1000],
          intensities: [1, 255],
          amplitude: 128);
    }),
  ].obs;

  Rx<BannerAd> bannerAd = BannerAd(
      size: AdSize(width: 0, height: 0),
      adUnitId: AdManager.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest())
      .obs;
  Rx<BannerAd> bannerAdBottom = BannerAd(
      size: AdSize(width: 0, height: 0),
      adUnitId: AdManager.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest())
      .obs;
  RxBool isLoadAds = false.obs;
  RxBool isLoadAdsBottom = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadBannerAds();
    loadBannerAdsBottom();
    loadInterstitialAd();
    loadRewardedAd();
    super.onInit();
  }

  void onTapStrength(BaseModel item){
      int index = getIndex(item, listStrength);
      for(int i = 0;i<listStrength.length;i++){
        listStrength[i].isSelected = false;
      }
      listStrength[index].isSelected = true;
      listStrength.refresh();
  }

  void onTapSpeed(BaseModel item){
    int index = getIndex(item, listSpeed);
    for(int i = 0;i<listSpeed.length;i++){
      listSpeed[i].isSelected = false;
    }
    listSpeed[index].isSelected = true;
    listSpeed.refresh();
  }

  void onTapSharpness(BaseModel item){
    int index = getIndex(item, listSharpness);
    for(int i = 0;i<listSharpness.length;i++){
      listSharpness[i].isSelected = false;
    }
    listSharpness[index].isSelected = true;
    listSharpness.refresh();
  }

  int getIndex(BaseModel item,List<BaseModel> listItem){
    return listItem.indexWhere((element) => element.title == item.title);
  }

  void loadBannerAds() {
    BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd.value = ad as BannerAd;
          isLoadAds.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }



  void loadBannerAdsBottom() {
    BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAdBottom.value = ad as BannerAd;
          isLoadAdsBottom.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdManager.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              rewardedAd = null;
              loadRewardedAd();
            },
          );
          rewardedAd = ad;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdManager.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              interstitialAd = null;
              loadInterstitialAd();
              print("onAdDismissedFullScreenContent");
            },
          );
          interstitialAd = ad;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }
}
