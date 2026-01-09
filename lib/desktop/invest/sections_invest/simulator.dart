import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../widgets/custom_text.dart';

class SimulatorSection extends StatefulWidget {
  const SimulatorSection({super.key});

  @override
  State<SimulatorSection> createState() => _SimulatorSectionState();
}

class _SimulatorSectionState extends State<SimulatorSection> {
  // Initial Values
  double _investmentAmount = 200000;
  double _creditRate = 3.5;
  double _creditDuration = 20;
  double _rentalYield = 5.0;

  // Calculated Values
  double get _monthlyRent => (_investmentAmount * (_rentalYield / 100)) / 12;

  double get _monthlyMortgage {
    if (_creditRate == 0) return _investmentAmount / (_creditDuration * 12);
    double monthlyRate = _creditRate / 100 / 12;
    int totalMonths = (_creditDuration * 12).round();
    return (_investmentAmount * monthlyRate) /
        (1 - pow(1 + monthlyRate, -totalMonths));
  }

  double get _monthlyCashFlow => _monthlyRent - _monthlyMortgage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5), // Same as Our Process
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                // Header
                const CustomText(
                  text: 'SIMULATEUR',
                  type: CustomTextType.sectionTagline,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text: 'Simulez Votre Rendement Locatif',
                  type: CustomTextType.sectionTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text:
                      'Estimez la rentabilité de votre investissement en quelques clics.',
                  type: CustomTextType.sectionDescriptionBlack,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),

                // Content Row
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Input Column (Left)
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: 'Paramètres de l\'Investissement',
                                type: CustomTextType.cardTitle,
                              ),
                              const SizedBox(height: 40),
                              _buildSlider(
                                label: 'Montant de l\'investissement',
                                value: _investmentAmount,
                                min: 50000,
                                max: 1000000,
                                divisions: 95,
                                suffix: '€',
                                onChanged: (val) =>
                                    setState(() => _investmentAmount = val),
                                formatValue: (val) => val
                                    .toStringAsFixed(0)
                                    .replaceAllMapped(
                                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                      (Match m) => '${m[1]} ',
                                    ),
                              ),
                              const SizedBox(height: 30),
                              _buildSlider(
                                label: 'Taux du crédit',
                                value: _creditRate,
                                min: 0.5,
                                max: 8.0,
                                divisions: 75,
                                suffix: '%',
                                onChanged: (val) =>
                                    setState(() => _creditRate = val),
                                formatValue: (val) => val.toStringAsFixed(1),
                              ),
                              const SizedBox(height: 30),
                              _buildSlider(
                                label: 'Durée du crédit',
                                value: _creditDuration,
                                min: 5,
                                max: 30,
                                divisions: 25,
                                suffix: 'ans',
                                onChanged: (val) =>
                                    setState(() => _creditDuration = val),
                                formatValue: (val) => val.toStringAsFixed(0),
                              ),
                              const SizedBox(height: 30),
                              _buildSlider(
                                label: 'Rendement locatif brut',
                                value: _rentalYield,
                                min: 1.0,
                                max: 15.0,
                                divisions: 140,
                                suffix: '%',
                                onChanged: (val) =>
                                    setState(() => _rentalYield = val),
                                formatValue: (val) => val.toStringAsFixed(1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),

                      // Result Column (Right)
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F172A), // Dark Blue
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: 'Résultats de la Simulation',
                                    type: CustomTextType.cardTitle,
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                  const SizedBox(height: 30),
                                  _buildResultCard(
                                    label: 'Loyer mensuel estimé',
                                    value:
                                        '${_monthlyRent.toStringAsFixed(0)} €',
                                    type: CustomTextType.label,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFDAA520),
                                    fontSize: 20,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildResultCard(
                                    label: 'Mensualité de crédit',
                                    value:
                                        '${_monthlyMortgage.toStringAsFixed(0)} €',
                                    type: CustomTextType.sectionDescription,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildResultCard(
                                    label: 'Cash-flow mensuel',
                                    value:
                                        '${_monthlyCashFlow > 0 ? '+' : ''}${_monthlyCashFlow.toStringAsFixed(0)} €',
                                    type: CustomTextType.sectionDescription,
                                    fontWeight: FontWeight.bold,
                                    color: _monthlyCashFlow >= 0
                                        ? const Color(0xFF4ADE80)
                                        : const Color(0xFFEF4444),
                                    fontSize: 24,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              // Yearly Yield Box
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDAA520), // Gold
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: 'Rendement annuel',
                                      type: CustomTextType.label,
                                    ),
                                    const SizedBox(height: 8),
                                    CustomText(
                                      text:
                                          '${_rentalYield.toStringAsFixed(2)}%',
                                      type: CustomTextType.sectionTitle,
                                      fontSize: 36,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '* Simulation indicative. Les résultats réels peuvent varier.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required String suffix,
    required Function(double) onChanged,
    required String Function(double) formatValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: label, type: CustomTextType.label),
            CustomText(
              text: '${formatValue(value)} $suffix',
              type: CustomTextType.label,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFDAA520),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Theme(
          data: ThemeData(
            sliderTheme: SliderThemeData(
              activeTrackColor: const Color(0xFFDAA520),
              inactiveTrackColor: const Color(0xFF0F172A),
              thumbColor: Colors.white,
              overlayColor: const Color(0xFFDAA520).withOpacity(0.2),
              trackHeight: 6.0,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
            ),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions > 0 ? divisions : null,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard({
    required String label,
    required String value,
    required CustomTextType type,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A3263), // Footer Color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: label,
            type: CustomTextType.label,
            color: Colors.white70,
            fontSize: 13,
          ),
          const SizedBox(height: 8),
          CustomText(
            text: value,
            type: type,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ],
      ),
    );
  }
}
