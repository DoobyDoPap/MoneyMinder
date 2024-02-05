// // GENERATED CODE - DO NOT MODIFY BY HAND


// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
// import 'package:hive/hive.dart';
// class AdddataAdapter extends TypeAdapter<Add_data> {
//   @override
//   final int typeId = 1;

//   @override
//   Add_data read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Add_data(
//       fields[3] as String,
//       fields[2] as String,
//       fields[4] as DateTime,
//       fields[1] as String,
//       fields[0] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Add_data obj) {
//     writer
//       ..writeByte(5)
//       ..writeByte(0)
//       ..write(obj.name)
//       ..writeByte(1)
//       ..write(obj.explain)
//       ..writeByte(2)
//       ..write(obj.amount)
//       ..writeByte(3)
//       ..write(obj.IN)
//       ..writeByte(4)
//       ..write(obj.datetime);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AdddataAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// @HiveType(typeId: 1)
// class Add_data extends HiveObject {
//   @HiveField(0)
//   String name;
//   @HiveField(1)
//   String explain;
//   @HiveField(2)
//   String amount;
//   @HiveField(3)
//   String IN;
//   @HiveField(4)
//   DateTime datetime;
//   Add_data(this.IN, this.amount, this.datetime, this.explain, this.name);
// }