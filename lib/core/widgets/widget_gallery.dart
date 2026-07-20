import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../l10n/locale_controller.dart';
import '../theme/tokens.dart';
import '../theme/typography.dart';
import 'app_text_field.dart';
import 'input_card.dart';
import 'loader_ring.dart';

import 'primary_button.dart';
import 'screen_scaffold.dart';
import 'selection_controls.dart';
import 'stage_check_row.dart';
import 'toast.dart';

/// Development-only catalogue of every core widget, so the component system can
/// be reviewed in one screen instead of discovering styling problems screen by
/// screen. Not part of the shipped flow.
class WidgetGallery extends ConsumerStatefulWidget {
  const WidgetGallery({super.key});

  @override
  ConsumerState<WidgetGallery> createState() => _WidgetGalleryState();
}

class _WidgetGalleryState extends ConsumerState<WidgetGallery> {
  final _text = TextEditingController(text: 'minh@example.com');
  final _area = TextEditingController(
    text: 'Gần đây tôi quay lại đá bóng nhưng nhanh xuống sức.',
  );
  final _number = TextEditingController(text: '172');

  String _segment = 'male';
  String _space = 'home';
  Set<String> _chips = {};
  Set<int> _days = {0, 2, 4};
  String? _dropdown = 'beginner';
  bool _checked = true;
  bool _stageDone = false;
  bool _switched = true;
  String _choice = 'omnivore';

  @override
  void dispose() {
    _text.dispose();
    _area.dispose();
    _number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ToastHost(
      child: ScreenScaffold(
        header: const ScreenHeader(title: 'Widget gallery'),
        footer: PrimaryButton(
          label: 'Primary CTA',
          onPressed: () => showAppToast(ref, 'Đã lưu kế hoạch mẫu'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressHairline(value: 0.4),
            const SizedBox(height: 24),

            _group('Locale', [
              SegmentedControl<String>(
                value: Localizations.localeOf(context).languageCode,
                onChanged: (code) => ref
                    .read(localeControllerProvider.notifier)
                    .set(Locale(code)),
                options: [
                  SelectOption(value: 'vi', label: t.localeVietnamese),
                  SelectOption(value: 'en', label: t.localeEnglish),
                ],
              ),
              Text(t.commonContinue, style: AppText.bodySm),
            ]),

            const SectionHeader(
              eyebrow: 'Section eyebrow',
              tone: AccentTone.lime,
              headline: 'Display headline\nover two lines.',
              body: 'Body copy sits under the headline at 13px.',
            ),
            const SizedBox(height: 24),

            _group('Buttons', [
              PrimaryButton(label: 'Lime CTA', onPressed: () {}),
              PrimaryButton(
                label: 'White variant',
                variant: PrimaryButtonVariant.white,
                onPressed: () {},
              ),
              PrimaryButton(
                label: 'Surface variant',
                variant: PrimaryButtonVariant.surface,
                onPressed: () {},
              ),
              const PrimaryButton(label: 'Disabled', onPressed: null),
              Row(
                children: [
                  CircleBackButton(onTap: () {}),
                  const SizedBox(width: 12),
                  Text('CircleBackButton', style: AppText.bodySm),
                ],
              ),
            ]),

            _group('Text inputs', [
              InputCard(
                child: LabeledField(
                  label: 'Email',
                  child: AppTextField(controller: _text, hint: 'you@mail.com'),
                ),
              ),
              InputCard(
                child: LabeledField(
                  label: 'Story',
                  child: AppTextArea(
                    controller: _area,
                    minLines: 3,
                    maxLines: 5,
                    showCounter: true,
                    counterBuilder: (n) => '$n ký tự',
                  ),
                ),
              ),
              InputCard(
                child: LabeledField(
                  label: 'Chiều cao',
                  child: UnitInput(controller: _number, unit: 'cm'),
                ),
              ),
            ]),

            _group('Selection', [
              InputCard(
                child: LabeledField(
                  label: 'Giới tính',
                  child: SegmentedControl<String>(
                    value: _segment,
                    onChanged: (v) => setState(() => _segment = v),
                    options: const [
                      SelectOption(value: 'male', label: 'Nam'),
                      SelectOption(value: 'female', label: 'Nữ'),
                      SelectOption(value: 'other', label: 'Khác'),
                    ],
                  ),
                ),
              ),
              InputCard(
                child: LabeledField(
                  label: 'Không gian (2 cột)',
                  child: SegmentedControl<String>(
                    value: _space,
                    columns: 2,
                    onChanged: (v) => setState(() => _space = v),
                    options: const [
                      SelectOption(value: 'home', label: 'Ở nhà'),
                      SelectOption(value: 'gym', label: 'Phòng gym'),
                      SelectOption(value: 'outdoor', label: 'Ngoài trời'),
                      SelectOption(value: 'minimal', label: 'Rất ít chỗ'),
                    ],
                  ),
                ),
              ),
              InputCard(
                child: LabeledField(
                  label: 'Thiết bị (exclusive none)',
                  child: ChipMultiSelect<String>(
                    selected: _chips,
                    exclusiveValue: 'none',
                    onChanged: (v) => setState(() => _chips = v),
                    options: const [
                      SelectOption(value: 'none', label: 'Không có'),
                      SelectOption(value: 'dumbbell', label: 'Tạ đơn'),
                      SelectOption(value: 'band', label: 'Dây kháng lực'),
                      SelectOption(value: 'pullup', label: 'Xà đơn'),
                    ],
                  ),
                ),
              ),
              InputCard(
                child: LabeledField(
                  label: 'Kinh nghiệm',
                  child: AppDropdown<String>(
                    value: _dropdown,
                    onChanged: (v) => setState(() => _dropdown = v),
                    options: const [
                      SelectOption(value: 'beginner', label: 'Mới bắt đầu'),
                      SelectOption(value: 'intermediate', label: 'Trung bình'),
                      SelectOption(value: 'advanced', label: 'Nâng cao'),
                    ],
                  ),
                ),
              ),
              InputCard(
                child: LabeledField(
                  label: 'Ngày tập',
                  trailing: Text(
                    '${_days.length} ngày',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lime,
                    ),
                  ),
                  child: DayToggleGrid(
                    labels: const ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
                    selected: _days,
                    onChanged: (v) => setState(() => _days = v),
                  ),
                ),
              ),
              InputCard(
                child: AppCheckbox(
                  value: _checked,
                  onChanged: (v) => setState(() => _checked = v),
                  label: 'Tôi xác nhận các thông tin trên là chính xác.',
                ),
              ),
            ]),

            _group('Switch & choice rows', [
              InputCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Đang đau hoặc chấn thương',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Thêm vùng cần tránh hoặc giảm tải',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSwitch(
                      value: _switched,
                      onChanged: (v) => setState(() => _switched = v),
                    ),
                  ],
                ),
              ),
              for (final (value, icon, title, sub) in const [
                ('omnivore', '🍚', 'Ăn đa dạng', 'Có thịt, cá, trứng hoặc sữa'),
                ('vegetarian', '🥚', 'Ăn chay', 'Có thể dùng trứng hoặc sữa'),
                ('vegan', '🌱', 'Thuần chay', 'Không dùng sản phẩm động vật'),
              ])
                ChoiceRow(
                  icon: icon,
                  title: title,
                  subtitle: sub,
                  selected: _choice == value,
                  onTap: () => setState(() => _choice = value),
                ),
            ]),

            _group('Accent cards', [
              for (final tone in AccentTone.values)
                AccentCard(
                  tone: tone,
                  eyebrow: tone.name,
                  child: Text('Card body in the ${tone.name} tone.',
                      style: AppText.bodySm),
                ),
              AccentCard(
                tone: AccentTone.neutral,
                eyebrow: 'Metrics',
                child: Row(
                  children: const [
                    Expanded(child: MetricTile(value: '3', caption: 'buổi/tuần')),
                    SizedBox(width: 8),
                    Expanded(child: MetricTile(value: '45’', caption: 'mỗi buổi')),
                    SizedBox(width: 8),
                    Expanded(child: MetricTile(value: '8', caption: 'tuần')),
                  ],
                ),
              ),
            ]),

            _group('Motion', [
              Row(
                children: [
                  const LoaderRing(size: 72),
                  const SizedBox(width: 24),
                  const LoaderRing(
                    size: 72,
                    period: AppMotion.ringSpin,
                  ),
                  const SizedBox(width: 24),
                  const LoadingDots(),
                ],
              ),
              StageCheckRow(index: 1, label: 'Xác định mục tiêu', done: _stageDone),
              StageCheckRow(index: 2, label: 'Sắp xếp ưu tiên', done: false),
              PrimaryButton(
                label: _stageDone ? 'Reset stage' : 'Complete stage',
                onPressed: () => setState(() => _stageDone = !_stageDone),
              ),
            ]),

            Text(
              'Fine print sits at white/27 and 11px.',
              style: AppText.fine,
            ),
          ],
        ),
      ),
    );
  }

  Widget _group(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: AppText.fieldLabel),
        const SizedBox(height: 12),
        for (final child in children) ...[
          child,
          const SizedBox(height: AppSpacing.stackGap),
        ],
        const SizedBox(height: 20),
      ],
    );
  }
}
