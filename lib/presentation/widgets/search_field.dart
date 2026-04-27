import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final VoidCallback? onFilterTap;

  const SearchField({
    super.key,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.readOnly = false,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      onSubmitted: onSubmitted,
      autofocus: !readOnly,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: Color(0xFFAAAAAA)),
        prefixIcon: const Icon(Icons.search, color: Color(0xFFAAAAAA)),
        suffixIcon: onFilterTap != null
            ? IconButton(
                icon: const Icon(Icons.tune, color: Color(0xFF007B7F)),
                onPressed: onFilterTap,
              )
            : null,
        filled: true,
        fillColor: const Color(0xFFF5F5F8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }
}
