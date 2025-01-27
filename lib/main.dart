import 'package:sagaliwallet/routing_table.dart';
import 'package:sagaliwallet/wallet_repository/wallet_repository.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ui_kit/bitcoin_ui_kit.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const SagaliWallet());
}

class SagaliWallet extends StatefulWidget {
  const SagaliWallet({super.key});

  @override
  State<SagaliWallet> createState() => _SagaliWalletState();
}

class _SagaliWalletState extends State<SagaliWallet> {
  final _lightTheme = LightBitcoinThemeData();
  final _darkTheme = DarkBitcoinThemeData();
  final _walletRepository = WalletRepository();

  late final dynamic _routerDelegate = RoutemasterDelegate(
    routesBuilder: (context) {
      return RouteMap(
        routes: buildRoutingTable(
          routerDelegate: _routerDelegate,
          walletRepository: _walletRepository,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return BitcoinTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp.router(
        title: 'Sagali Wallet',
        theme: _lightTheme.materialThemeData,
        darkTheme: _darkTheme.materialThemeData,
        themeMode: ThemeMode.light,
        routerDelegate: _routerDelegate,
        routeInformationParser: const RoutemasterParser(),
      ),
    );
  }
}
