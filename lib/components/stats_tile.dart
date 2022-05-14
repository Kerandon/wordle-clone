import 'package:flutter/material.dart';

class StatsTile extends StatelessWidget {
  const StatsTile({
    required this.heading,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String heading;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: const Alignment(0, 1),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 40,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: FittedBox(
              alignment: const Alignment(0, -1),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Text(
                  heading,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
