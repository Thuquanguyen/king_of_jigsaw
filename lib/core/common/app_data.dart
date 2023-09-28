import 'package:get/get.dart';

import '../assets/app_assets.dart';
import '../model/base_model.dart';

class AppData {
  RxList<BaseModel> listTitles = <BaseModel>[
    BaseModel(
        title: 'Premier League',
        icon: AppAssets.imgPremierLeague,
        isSelected: true),
    BaseModel(title: 'La Liga', icon: AppAssets.logoLaliga),
    BaseModel(title: 'Serie A', icon: AppAssets.logoSeriea),
    BaseModel(title: 'Bundesliga', icon: AppAssets.logoBundesliga),
    BaseModel(title: 'Ligue 1', icon: AppAssets.logoLigue1),
    BaseModel(title: 'MSL', icon: AppAssets.logoMsl),
    BaseModel(title: 'Saudi Pro League', icon: AppAssets.logoSaudi),
    // BaseModel(title: 'Brasileirão', icon: AppAssets.logoBrazil),
    // BaseModel(title: 'Liga Profesional', icon: AppAssets.logoArgentina),
    // BaseModel(title: 'Primeira Liga', icon: AppAssets.logoPrimeira),
    // BaseModel(title: 'Eredivisie', icon: AppAssets.logoEredivisie),
    // BaseModel(title: 'K League', icon: AppAssets.logoKLeague),
    // BaseModel(title: 'J League', icon: AppAssets.logoJLeague),
    // BaseModel(title: 'Thai League', icon: AppAssets.logoThaiLeague),
    // BaseModel(title: 'V.League', icon: AppAssets.logoVLeague),
    // BaseModel(title: 'Liga 1', icon: AppAssets.logoLiga1),
    // BaseModel(title: 'Chinese Super League', icon: AppAssets.logoChinaSuper),
  ].obs;
}
