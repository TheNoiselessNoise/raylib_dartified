part of '../../../raylib.dart';

final class LightC extends Struct {
  @Int()
  external int type;

  @Bool()
  external bool enabled;

  external Vector3C position;

  external Vector3C target;

  external ColorC color;

  @Float()
  external double attenuation;

  @Int()
  external int enabledLoc;

  @Int()
  external int typeLoc;

  @Int()
  external int positionLoc;

  @Int()
  external int targetLoc;

  @Int()
  external int colorLoc;

  @Int()
  external int attenuationLoc;
}