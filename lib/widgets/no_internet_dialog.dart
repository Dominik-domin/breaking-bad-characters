import 'package:auto_route/auto_route.dart';
import 'package:breaking_bad_characters/helpers/strings.dart';
import 'package:flutter/material.dart';

Widget buildNoInternetDialog({
  required BuildContext context,
  required bool isLocalStorageEmpty,
  required VoidCallback onConfirmButtonPressed,
}) =>
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              Strings.noInternetInfo,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              isLocalStorageEmpty
                  ? Strings.checkConnectionInfo
                  : Strings.localStorageIsNotEmptyInfo,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            _buildButtonBox(
              context: context,
              isLocalStorageEmpty: isLocalStorageEmpty,
              onConfirmButtonPressed: onConfirmButtonPressed,
            ),
          ],
        ),
      ),
    );

Widget _buildButtonBox({
  required BuildContext context,
  required bool isLocalStorageEmpty,
  required VoidCallback onConfirmButtonPressed,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildDialogButton(
            onPressed: () {
              context.router.popUntilRoot();
            },
            label: Strings.close,
          ),
          if (!isLocalStorageEmpty) const SizedBox(width: 20),
          if (!isLocalStorageEmpty)
            _buildDialogButton(
              onPressed: onConfirmButtonPressed,
              label: Strings.confirm,
            ),
        ],
      ),
    );

Widget _buildDialogButton(
        {required VoidCallback onPressed, required String label}) =>
    InkWell(
      onTap: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.purple,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
