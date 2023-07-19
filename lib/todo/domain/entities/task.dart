import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Task extends Equatable {
  final String title;
  final String note;
  final bool isCompleted;
  final String startTime;
  final String endTime;
  final Color color;

  const Task(
    this.title,
    this.note,
    this.isCompleted,
    this.startTime,
    this.endTime,
    this.color,
  );

  @override
  List<Object?> get props => [
        title,
        note,
        isCompleted,
        startTime,
        endTime,
        color,
      ];
}
