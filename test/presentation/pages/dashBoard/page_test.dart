import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:product_listing/core/utils/getStorage.dart';
import 'package:product_listing/domain/repositories/product.dart';
import 'package:product_listing/presentation/bloc/dashboard/bloc.dart';
import 'package:product_listing/presentation/bloc/dashboard/event.dart';
import 'package:product_listing/presentation/bloc/dashboard/state.dart';
import 'package:product_listing/presentation/bloc/product/bloc.dart';
import 'package:product_listing/presentation/bloc/wishList/bloc.dart';
import 'package:product_listing/presentation/pages/dashBoard/favourite/tab.dart';
import 'package:product_listing/presentation/pages/dashBoard/home/tab.dart';
import 'package:product_listing/presentation/pages/dashBoard/page.dart';



/// Mock class for DashBoardBloc
class MockDashBoardBloc extends Mock implements DashBoardBloc {}
class MockProductRepository extends Mock implements ProductRepository {}


void main() {
  late MockDashBoardBloc mockDashBoardBloc;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockDashBoardBloc = MockDashBoardBloc();
    mockProductRepository = MockProductRepository();
   

    when(() => mockDashBoardBloc.stream).thenAnswer((_) => Stream<DashBoardState>.fromIterable(<DashBoardState>[
      const DashBoardState(),
      const DashBoardState(pageIndex: 1),
      
     
    ]));

    when(() => mockDashBoardBloc.state).thenReturn(const DashBoardState());
    when(() => mockDashBoardBloc.close()).thenAnswer((_) async {});

    when(() => mockProductRepository.get()).thenAnswer((_) async => []);
   
  });

  tearDown(() {
    mockDashBoardBloc.close();
  });

  testWidgets('DashBoardPage displays HomeTab initially and check ', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc( mockProductRepository),
          ),
          BlocProvider(
            create: (context) =>
                WishlistBloc(appGetXStorage: AppGetXStorage.instance),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            home: BlocProvider<DashBoardBloc>(
              create: (BuildContext context) => mockDashBoardBloc,
              child: const DashBoardPage(),
            ),
          ),
        ),
      ),
    );

    print('Initial pump completed');
    expect(find.byType(HomeTab), findsOneWidget);
    expect(find.byType(FavouriteTab), findsNothing);


    mockDashBoardBloc.add(const ChangeTabDashBoardEvent(1));
    print('Event added');

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump();
    print('Manual pump completed');

    expect(find.byType(FavouriteTab), findsOneWidget);
    expect(find.byType(HomeTab), findsNothing);

    
  });
}
