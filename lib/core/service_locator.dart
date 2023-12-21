import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get_it/get_it.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:abs_customer_sites/application/admin_panel/add_service_form/add_service_from_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/dealership_managment/dealership_list/dealership_list_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/dealership_managment/testimonials/add_testimonial/add_testimonial_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/dealership_managment/testimonials/testimonial_list/testimonial_list_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/requests_page/requests_page_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_detail_page/ticket_detail_page_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_page/ticket_page_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_reply/ticket_reply_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/web_desciption/web_description_bloc.dart';
import 'package:abs_customer_sites/application/core/global_bloc/global_bloc_bloc.dart';
import 'package:abs_customer_sites/application/core/sign_in/sign_in_bloc.dart';
import 'package:abs_customer_sites/application/core/sign_up/sign_up_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/add_vehicle/add_vehicle_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_view_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/lead/lead_bloc.dart';
import 'package:abs_customer_sites/application/services/orientation_watcher.dart';
import 'package:abs_customer_sites/application/services/ticker.dart';
import 'package:abs_customer_sites/data/admin_panel/dealership/dealership_repository_impl.dart';
import 'package:abs_customer_sites/data/admin_panel/sign_up_request/sign_up_request_repository_impl.dart';
import 'package:abs_customer_sites/data/admin_panel/testimonial/testimonial_repository_impl.dart';
import 'package:abs_customer_sites/data/admin_panel/ticket/ticket_repository_impl.dart';
import 'package:abs_customer_sites/data/admin_panel/ticket_repy/ticket_reply_repository_impl.dart';
import 'package:abs_customer_sites/data/admin_panel/web_description/web_description_repository_impl.dart';
import 'package:abs_customer_sites/data/core/auth/auth_service_impl.dart';
import 'package:abs_customer_sites/data/core/secure_storage.dart';
import 'package:abs_customer_sites/data/core/shared-prefrences/shared_prefrences.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/book_appointment/book_appointment_repository_impl.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/car_finder/car_finder_repository_impl.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/contact_us/contact_us_repository_impl.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/order_part/order_part_repository_impl.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/service_appointment/service_appointment_repository_impl.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/test_drive/test_drive_repository_impl.dart';
import 'package:abs_customer_sites/data/dealership_panel/lead/value_trade/value_trade_repository_impl.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership_repository.dart';
import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request_repository.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial_repository.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_repository.dart';
import 'package:abs_customer_sites/domain/core/auth/auth_service.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket_repository.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply_repository.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment_repository.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/car_finder/car_finder.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/car_finder/car_finder_repository.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/contact_us/contact_us_repository.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/order_part/order_part_repository.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/service_appointment/service_appointment_repository.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/test_drive/test_drive_repository.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/value_trade/value_trade_repository.dart';

// craeting a global varaible of getIt to ebing able to use it throuhout the app
GetIt getIt = GetIt.instance;

// injecting diffrent classes that we want to use the the app starts
void setUpGetIt() {
  // Singletons
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<CookieJar>(CookieJar());
  getIt.registerSingleton<GlobalBloc>(GlobalBloc(dio: getIt<Dio>()));
  getIt.registerSingleton<AuthService>(AuthServiceImpl(dio: getIt<Dio>()));
  getIt.registerSingleton<OrientationWatcher>(OrientationWatcher());

  getIt.registerSingleton<SingUpRequestRepository>(SignUpRequestRepositoryImpl(
    dio: getIt<Dio>(),
  ));
  getIt.registerSingleton<TestimonialRepository>(
    TestimonialRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<SecureStorage>(SecureStorageImpl(
    secureStorage: FlutterSecureStorage(),
  ));

  getIt.registerSingleton<DealershipRepository>(DealershipRepositoryImpl(
    dio: getIt<Dio>(),
  ));
  getIt
      .registerSingleton<WebDescriptionRepository>(WebDescriptionRepositoryImpl(
    dio: getIt<Dio>(),
  ));
  getIt.registerSingleton<TicketRepository>(TicketRepositoryImpl());
  getIt.registerSingleton<Ticker>(Ticker());
  getIt.registerSingleton<UserPreferences>(UserPreferencesImpl());
  getIt.registerSingleton<RequestsPageBloc>(RequestsPageBloc(
    singUpRequestRepository: getIt<SingUpRequestRepository>(),
  ));
  getIt.registerSingleton<TicketPageBloc>(
    TicketPageBloc(
      ticketRepository: getIt<TicketRepository>(),
    ),
  );

  getIt.registerSingleton<ContactUsDealershipRepository>(
    ContactUsDealershipRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<ValueTradeRepository>(
    ValueTradeRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<OrderPartRepository>(
    OrderPartRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<TestDriveRepository>(
    TestDriveRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<ServiceAppointmentRepository>(
    ServiceAppointmentRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<BookAppointmentRepository>(
    BookAppointmentRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<CarFinderRepository>(
    CarFinderRepositoryImpl(
      dio: getIt<Dio>(),
    ),
  );
  // Factories
  getIt.registerFactory<SignInBloc>(
    () => SignInBloc(
      globalBloc: getIt<GlobalBloc>(),
      authService: getIt<AuthService>(),
      secureStorage: getIt<SecureStorage>(),
    ),
  );
  getIt.registerFactory<CameraViewBloc>(
    () => CameraViewBloc(
      ticker: getIt<Ticker>(),
    ),
  );

  // if we want to create a class and also send paramters to getIt to create a class
  // with those arguments , we will use registerFactoryparam and send up to two
  // varaibles to getIt, below testimonial and dealership are those two

  getIt.registerFactoryParam<AddTestimonialBloc, Testimonial, Dealership>(
    (testimonial, dealership) => AddTestimonialBloc(
      testimonial: testimonial,
      dealership: dealership,
      testimonialRepository: getIt<TestimonialRepository>(),
    ),
  );
  getIt.registerFactoryParam<TestimonialListBloc, Dealership, void>(
    (dealership, _) => TestimonialListBloc(
      dealership: dealership,
      testimonialRepository: getIt<TestimonialRepository>(),
    ),
  );
  getIt.registerFactory<AddServiceFromBloc>(() => AddServiceFromBloc());
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc());
  getIt.registerFactory<AddVehicleBloc>(() => AddVehicleBloc());

  getIt.registerFactory<DealershipListBloc>(
    () => DealershipListBloc(
      dealershipRepository: getIt<DealershipRepository>(),
    ),
  );

  getIt.registerFactory(
    () => LeadBloc(
      contactUsRepository: getIt<ContactUsDealershipRepository>(),
      valueTradeRepository: getIt<ValueTradeRepository>(),
      orderPartRepository: getIt<OrderPartRepository>(),
      testDriveRepository: getIt<TestDriveRepository>(),
      serviceAppointmentRepository: getIt<ServiceAppointmentRepository>(),
      carFinderRepository: getIt<CarFinderRepository>(),
      bookAppointmentRepository: getIt<BookAppointmentRepository>(),
    ),
  );

  getIt.registerFactoryParam<TicketReplyBloc, Ticket, void>(
    (ticket, _) => TicketReplyBloc(
      ticket: ticket,
      ticketReplyRepository: getIt<TicketReplyRepository>(),
    ),
  );
  getIt.registerFactoryParam<TicketDetailPageBloc, Ticket, void>(
    (ticket, _) => TicketDetailPageBloc(
      ticketReplyRepository: getIt<TicketReplyRepository>(),
      ticketRepository: getIt<TicketRepository>(),
      ticket: ticket,
    ),
  );
  getIt.registerFactoryParam<WebDescriptionBloc, Dealership, void>(
    (dealership, _) => WebDescriptionBloc(
      dealership: dealership,
      webDescriptionRepository: getIt<WebDescriptionRepository>(),
    ),
  );

  // Ui controllers
  getIt.registerSingleton<PageController>(PageController(initialPage: 1));
  getIt.registerSingleton<ZoomDrawerController>(ZoomDrawerController());
}
