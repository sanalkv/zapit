import 'package:flutter/material.dart';
import 'package:zapit/core/helpers/error_handler.dart';
import 'loader.dart';

class ResponseHandler extends StatelessWidget {
  const ResponseHandler({
    Key? key,
    required this.isBusy,
    required this.hasError,
    required this.error,
    required this.child,
    this.showLoader = true
  }) : super(key: key);
  final bool isBusy;
  final bool hasError;
  final dynamic error;
  final Widget child;
  final bool showLoader;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isBusy 
          ? showLoader? const Center(
              child: Loader(),
            ) : SizedBox.shrink()
          : hasError
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30) ,
                    child: Text(
                     errorHandler(error),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : child,
    );
  }
}
