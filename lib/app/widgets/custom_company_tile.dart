import 'package:flutter/material.dart';

class CustomComPanyListTile extends StatelessWidget {
  const CustomComPanyListTile({
    super.key,
    required this.title,
    required this.sharePrice,
    this.needAddButton = true,
    this.onTap,
  });
  final String title;
  final String sharePrice;
  final bool needAddButton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceIn,
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            trailing: needAddButton
                ? InkWell(
                    onTap: onTap,
                    child: const SizedBox(
                        height: 60,
                        width: 50,
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 36,
                          color: Colors.blueAccent,
                        )),
                  )
                : InkWell(
                    onTap: onTap,
                    child: SizedBox(
                        height: 60,
                        width: 50,
                        child: Icon(
                          Icons.delete,
                          size: 36,
                          color: Colors.redAccent.shade700,
                        )),
                  ),
            title: Text(title),
            subtitle: Text('Share price : $sharePrice'),
          ),
        ),
      ),
    );
  }
}
