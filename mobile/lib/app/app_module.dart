import 'package:ceulp.exitus/app/shared/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ceulp.exitus/app/app_controller.dart';

import 'app_widget.dart';
import 'modules/NewOpportunityScreen/new_opportunity_screen.dart';
import 'modules/home/home_controller.dart';
import 'modules/home/home_page.dart';
import 'modules/perfil/perfil_controller.dart';
import 'modules/perfil/perfil_page.dart';
import 'shared/repositories/perfil_repository.dart';

import 'package:ceulp.exitus/app/modules/main_screen.dart';

class AppModule extends MainModule {
  @override
  // injeção de dependencias
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
        Bind((i) => PerfilController()),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))), // Global http client

        //Repositories
        Bind((i) => PerfilRepository(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter('/perfil/create', child: (_, args) => PerfilPage()),
        ModularRouter('/publishMedia', child: (_, args) => PublishPage()),
        ModularRouter('/NewOpportunity',
            child: (_, args) => NewOpportunityPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
