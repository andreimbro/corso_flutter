import 'package:flutter/material.dart';

enum Interessi { Mare, Montagna, Lago, Piscina, Spa, Bosco }

extension InteressiEx on Interessi {
  IconData get icon {
    switch (this) {
      case Interessi.Mare:
        return Icons.home;

      case Interessi.Montagna:
        return Icons.filter_hdr;

      case Interessi.Lago:
        return Icons.sailing;

      case Interessi.Piscina:
        return Icons.pool;

      case Interessi.Spa:
        return Icons.bed;

      case Interessi.Bosco:
        return Icons.nature;
    }
  }

  Color get color {
    switch (this) {
      case Interessi.Mare:
        return Colors.blue;

      case Interessi.Montagna:
        return Colors.orange;

      case Interessi.Lago:
        return Colors.purple;

      case Interessi.Piscina:
        return Colors.green;

      case Interessi.Spa:
        return Colors.blue;

      case Interessi.Bosco:
        return Colors.orange;
    }
  }
}
