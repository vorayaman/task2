import 'package:flutter/material.dart';

class BrandFilterDialog extends StatefulWidget {
  final List<String> availableBrands;
  final Set<String> selectedBrands;

  const BrandFilterDialog(
      {super.key, required this.availableBrands, required this.selectedBrands});

  @override
  _BrandFilterDialogState createState() => _BrandFilterDialogState();
}

class _BrandFilterDialogState extends State<BrandFilterDialog> {
  Set<String> _tempSelectedBrands = {};

  @override
  void initState() {
    super.initState();
    _tempSelectedBrands = Set.from(widget.selectedBrands);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Brands'),
      content: SingleChildScrollView(
        child: Column(
          children: widget.availableBrands.map((brand) {
            return CheckboxListTile(
              title: Text(brand),
              value: _tempSelectedBrands.contains(brand),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _tempSelectedBrands.add(brand);
                  } else {
                    _tempSelectedBrands.remove(brand);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.pop(context, null),  
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pop(context, _tempSelectedBrands),  
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
