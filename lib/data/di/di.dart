import 'package:andrews_app/data/network/azure_nlu_http_client.dart';
import 'package:andrews_app/data/network/bible_api_http_client.dart';
import 'package:andrews_app/data/network/http_interceptor.dart';
import 'package:andrews_app/features/search_verses_voice/data/repositories/azure_nlu_repository_impl.dart';
import 'package:andrews_app/features/search_verses_voice/data/repositories/bible_repository_impl.dart';
import 'package:andrews_app/features/search_verses_voice/data/sources/azure_remote_data_source.dart';
import 'package:andrews_app/features/search_verses_voice/data/sources/azure_remote_data_source_impl.dart';
import 'package:andrews_app/features/search_verses_voice/data/sources/bible_remote_data_source.dart';
import 'package:andrews_app/features/search_verses_voice/data/sources/bible_remote_data_source_impl.dart';
import 'package:andrews_app/features/search_verses_voice/domain/repositories/azure_nlu_repository.dart';
import 'package:andrews_app/features/search_verses_voice/domain/repositories/bible_repository.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/azure_luis_use_case.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/azure_luis_use_case_impl.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/bible_use_case.dart';
import 'package:andrews_app/features/search_verses_voice/domain/use_cases/bible_use_case_impl.dart';
import 'package:andrews_app/features/search_verses_voice/presentation/search_verses_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:speech_to_text/speech_to_text.dart';

class DependenciesInjection {
  Future start() {
    return Future.value({
      UtilInjections.init(),
      DataSourceInjections.init(),
      RepositoryInjection.init(),
      UseCaseInjection.init(),
      ControllerInjection.init(),
    });
  }
}

class ControllerInjection {
  static void init() {
    Get.put(MainController(Get.find<AzureLuisUseCase>(),
        Get.find<BibleUseCase>(), SpeechToText()));
  }
}

class DataSourceInjections {
  static void init() {
    Get.put<AzureRemoteDataSource>(
        AzureRemoteDataSourceImpl(Get.find<AzureNLUHttpClient>()));

    Get.put<BibleRemoteDataSource>(
        BibleRemoteDataSourceImpl(Get.find<BibleApiHttpClientImpl>()));
  }
}

class RepositoryInjection {
  static void init() {
    Get.put<AzureNLURepository>(
        AzureNLURepositoryImpl(Get.find<AzureRemoteDataSource>()));

    Get.put<BibleRepository>(
        BibleRepositoryImpl(Get.find<BibleRemoteDataSource>()));
  }
}

class UtilInjections {
  static void init() {
    Get.put<AzureNLUHttpClient>(AzureNLUHttpClient(Dio(), [HttpInterceptor()]));

    Get.put<BibleApiHttpClientImpl>(
        BibleApiHttpClientImpl(Dio(), [HttpInterceptor()]));
  }
}

class UseCaseInjection {
  static void init() {
    Get.put<AzureLuisUseCase>(
        AzureLuisUseCaseImpl(Get.find<AzureNLURepository>()));

    Get.put<BibleUseCase>(BibleUseCaseImpl(Get.find<BibleRepository>()));
  }
}
