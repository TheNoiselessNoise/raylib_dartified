part of '../../raylib_dartified_unhinged.dart';

/// Provides access to the [Entity] this object belongs to.
mixin HasEntityAccess<T extends App<T>> on ECSBase<T> {
  Entity<T> get entity;
}