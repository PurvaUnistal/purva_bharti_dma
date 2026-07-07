import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/text_form_widget.dart';

import 'Loader/DottedLoader.dart';

class SearchTextField extends StatefulWidget {
  final void Function(dynamic) onChange;
  final void Function(dynamic) onClick;
  final List<dynamic> list;
  final String label;
  final TextEditingController? controller;
  final bool? isLoader;
  final String Function(dynamic item) itemLabel;

  const SearchTextField({
    super.key,
    required this.onChange,
    required this.onClick,
    required this.label,
    required this.list,
    required this.itemLabel,
    this.isLoader,
    this.controller,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void didUpdateWidget(SearchTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // list or loader changed → rebuild/show/hide the popup
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncOverlay());
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _syncOverlay() {
    if (!mounted) return;
    final shouldShow = widget.isLoader == true || widget.list.isNotEmpty;
    if (shouldShow) {
      if (_overlayEntry == null) {
        _overlayEntry = _buildOverlay();
        Overlay.of(context).insert(_overlayEntry!);
      } else {
        _overlayEntry!.markNeedsBuild();
      }
    } else {
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _buildOverlay() {
    final renderBox = context.findRenderObject() as RenderBox?;
    final width = renderBox?.size.width ?? MediaQuery.of(context).size.width;
    final fieldHeight = renderBox?.size.height ?? 56;

    return OverlayEntry(
      builder: (overlayContext) {
        final textColor = Theme.of(overlayContext).colorScheme.onSurface;
        return Positioned(
          width: width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, fieldHeight + 4), // just below the field
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(overlayContext).cardColor,
              child: widget.isLoader == true
                  ? const SizedBox(height: 56, child: DottedLoaderWidget())
                  : ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight:
                  MediaQuery.of(overlayContext).size.height / 3,
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: widget.list.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, index) {
                    final item = widget.list[index];
                    return InkWell(
                      onTap: () {
                        _removeOverlay();       // close immediately on tap
                        widget.onClick(item);   // bloc fills form + clears list
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Text(
                          widget.itemLabel(item),
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFieldWidget(
        labelText: widget.label,
        isRequired: true,
        controller: widget.controller,
        onChanged: (keyWord) => widget.onChange(keyWord),
      ),
    );
  }
}